Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BFFC87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUnoTmnH4UQWaRTTZNVsbrd9QMSbQMOemTKMnhgtsqc=; b=rw0QDKngdpAYka
	aAEEKnX+PWk4uQlBmD0Rj7ssYXGMpxVR3xLZF7k89LlE6pauKj+uvI4AAo/t5BW2s+ozuuNN9/rmJ
	3uKiACI610RBF/ewnXsuMzDhQsSE+tfj/kxEnBGtJViKtcDCttroEmZ+OuAX8APvfywslQJy8JlW5
	YtqaUxmd+qt3Rw9d+qVWf2BMe1ip2LhkpyfLDuNmyxBf8rmlc+Jo9t1J0BHGNXzcuWw664Xr8er69
	HVlonudJTfhGyiusQyECE2kfDAcJcpO9YW377haAzy1CekIO1UHcgLitc2qQnWZK21OVt072qz0mL
	sLu8MrXQzao5/uKBYXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3as-00000008VlY-0HpX;
	Thu, 24 Jul 2025 21:35:14 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Z1-00000008Vfq-3cV8
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 21:33:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55502821bd2so1671522e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 14:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753392797; x=1753997597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9WMuKhGKTGANqNj5nS9I/cs92WS44yAF8Kqy+9Sz/s=;
        b=3CDPVaiEDXwXP60dxiYyC1bZqGri06Q/YvpkF870ONee7pKfnvsRbI1Yysx2LiOfXH
         FCps4AJpOUPcGExiMJnKjfO04ky0MmDuIWZsdtkg4sp2lEn3Yy6QF+8nmAzCriXyqfQP
         ZVOPdSM1l3y6JOoOYLG53TQyft8t+FRrgpQoHS7wr0Vbitx0Zjtn3ZqeBxZM6KxkmZ2j
         5QufiZEeONR3JtIww6daXIFY4Wgf8WOKUJAALbLxyiuJMPeVAKR6SkhKcjqv9+oy5sMk
         Jd+BSr3gG5o45v+tJbSwEMUfBabsj7Q9ETLHc4TgWHdmcCf28eZgdAEJ0S53VrPGxaLc
         JFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392797; x=1753997597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9WMuKhGKTGANqNj5nS9I/cs92WS44yAF8Kqy+9Sz/s=;
        b=xDzGkmeEjn8C9gCZFsPGGPiHb+uEKUK6JPyzlG0q2Cgl9lbT6XmjH3ovlzAsfIb7SU
         +lJfodyrtlJbEhYU6Vo3NdyzHUVCOT/OpxdbJhrnQyRPmJ2PtViLgKCR+5rRcLBrqa18
         C8NBiRotacClZO+Y4XkGIyioPCXgivp5QG2RHtLKhYrJ/lc6WLgMbjVQNXLgyI0aLCYP
         7nUrERE7N4rNpGfjJfu8lvTfCL2wlKFCSX/ZSAafimkFEne+Ab28U2J3AQv4Y5PUNLa/
         JFfrX02NjOCfmVuAVhRCgIMn13YGvTamMyMY4J91ASez+KQPxZ8MUK1adi9DSp0KI+xw
         j6vg==
X-Forwarded-Encrypted: i=1; AJvYcCXD8BuG4da3N5VeqNXMvq8HcRdaoo7Ms5eRXWwVIxT9YQrkwUyTjeE1IiXyBZzN9aFpZAPfjWjeCnj3SA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxeh/ImBF0YZFNqpcavhFvOjVyXs0VZJHTuuWDThVxyNVlAWd+Y
	5zA505VVDU5NPOYrX4l+fynQT07iu9mBlaPWETuEG0tKn5tW9L0naFmvwzwUz+MPzoZauGv44dG
	sGLdsyGbVocVvo5OgXJRBLEYyUA3OwokrnhDXxPQ7
X-Gm-Gg: ASbGncvMffxlj47IDMypIg2F1dejwYw9K5DWAemk7hESlQSXp7XFqVqA70pkFjhGQi1
	qM9oHur1KX+EUV6TLe2YFsz2mxTm/b6uAjC/2mpDd3vJhOssb/bkcQhz6/h9UWXxzHLRMG5dR1g
	3EVTXE1zBQ7E7MSVHOjSagjP+5sbijt5mSqdzJnsb7qiWDj3gaaRJ2oEmTwEMRIVz0NLLsOwL0e
	86TFbYE7H86KQlfjg==
X-Google-Smtp-Source: AGHT+IHMRXSUQruSwAGvnGOD3EQouFK5BDuoQQKLfjudXv/r48PrAlD00NV88CdLcnUOYHt4d/CAR2Ul5KGcFwPrzvI=
X-Received: by 2002:a05:6512:3ba8:b0:55a:4e55:cb94 with SMTP id
 2adb3069b0e04-55a5136ec3cmr2426178e87.8.1753392797019; Thu, 24 Jul 2025
 14:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250724213130.3374922-1-dmatlack@google.com>
In-Reply-To: <20250724213130.3374922-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 24 Jul 2025 14:32:49 -0700
X-Gm-Features: Ac12FXwHf9eQdiI06f_G5BDqiKGfQdnCV_Ln38G7zauukGS93UKJVW47OIweLbs
Message-ID: <CALzav=dimvJG3aDBtzhi=t+OAp-10oGAmOuSSHOpSTYtK1Af6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Use $(SRCARCH) and share
 definition with top-level Makefile
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_143319_901548_46126E4D 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMjQsIDIwMjUgYXQgMjozMeKAr1BNIERhdmlkIE1hdGxhY2sgPGRtYXRsYWNr
QGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgc3dpdGNoZXMgdGhlIEtWTSBzZWxm
dGVzdHMgTWFrZWZpbGUgdG8gdXNlICQoU1JDQVJDSCkKPiBpbnN0ZWFkIG9mICQoQVJDSCkgdG8g
Zml4IGEgYnVpbGQgaXNzdWUgd2hlbiBBUkNIPXg4Nl82NCBpcyBzcGVjaWZpZWQgb24KPiB0aGUg
Y29tbWFuZCBsaW5lLgoKUGxlYXNlIGlnbm9yZSB0aGUgImFuZCBzaGFyZSBkZWZpbml0aW9uIHdp
dGggdG9wLWxldmVsIE1ha2VmaWxlIiBmcm9tCnRoZSB0aXRsZS4gSSBlbmRlZCB1cCBkcm9wcGlu
ZyB0aGF0IHBhdGNoIGZyb20gdGhlIHNlcmllcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
