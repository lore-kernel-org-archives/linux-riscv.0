Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5492CD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 09:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaTlbVzEaDEC3XoJV+WWdkw6M8P2im/y+/xcBsT/hpw=; b=LdSYyP31weNI4c
	/+63kprVmnNun8XUcMi0lhHGs4AtwdOvhN/VoBJZqbsv51ur/fuiNxwamHpAdyQfjPev5lGWZTE8W
	LtpfL6GWICV5VH4mjq+1sJuZzUy/QTmYhBMD7mwiZKSFZbA2dzHub0QxZRgz2yIG2wtEwXIJ1WZkx
	iJh5avDXiy1PcLl05KcMs4PlTJ//2KJ4UbfOboukQnqiMMv9bEqbpOrLVXVluuXquaR3r436ZXOAi
	UJqoXPnD0HlUGsiaqzSRfyksh8Otp6z+qXzM9E2sbYudc1xXPIq+qxfEelRBL6SCIHwqw/ZSgBlSm
	fsWpbxNQ2I15oWkFTDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNomH-00000007sH3-3uW0;
	Fri, 15 May 2026 09:24:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNomF-00000007sGN-3Vtc
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 09:24:16 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-43d75312379so479126f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 02:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778837054; x=1779441854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6c5hfgSD5xJa00nFFCK7kaxUQ5uueiePQvAM1Cjtv/s=;
        b=LZE1VorbEkoBCXbNNb7/JVRP/4iQrZLThubXNAgrQ6TWyC7VyMakBI1jUEjFK40Z9D
         cdHUVjU6XWXSpeKLUziU7A51JIB6iCdx9OdKHyoGiPPo0bT5sS/5fL3/Zey5qezjv1dl
         sDvu2RmGLUMJCEXqAPp3tn4YZbCWPuHTf1AyrkKncYGJ3YECHHzueL/k1tlB+YperuYS
         +xaV9SXZnv6+kwwAI9a0BPu1YgiH3n4Vdp0/jN9q3DmgiCdA2wSD9Fs/rY8fkc0FHaXm
         s/9NncrY3bqc7xe/o0GeWKgRWWfMe4feoUMbdOQLOdFZlZTb1c8e4aL8k6xaq8Sw+8vP
         UAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837054; x=1779441854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6c5hfgSD5xJa00nFFCK7kaxUQ5uueiePQvAM1Cjtv/s=;
        b=G+UCUIy70mZ4tMiAxHAXqKC95bM3/ELX1SbE3jGMnK4Q5Vffp7pVrsWLTg/TjLuLyl
         aKciFAsiO9/pKf8DLXmhTxIS4//lqLTX0r04FcqPcCBRY9IkYybmMWngw4O193eNULL0
         fTlQCqPN8jp074fJ+7WMfOH8Db16/5YW+CBUSdedQLgLfudSgDC5gdtgeLMKwFdZFKrs
         jvnYtxSQDbsQ0FYqoq237I/z9OuQsY3NetCVDJeJz6JdoZKJVF9wYMzNKjUEQjkXQUJi
         at9qolxIpZFvxRpSAcNlSK6ldFsDerbdqEWhk6fAlguNtOuPFTdI1DtEw4e1j2rfz7II
         6zkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+ejGLtqMKPiQH7IF6rS/HJ3nnLeQIrolUPy9EkybM4Fq78Cu/92sD1qpGOsfGSiULVQ2wExRFPbwBnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJfhmn5PvIzNlpOMY4QuX1Z2DZEUUAC/MfDvjjqM1zScnU5bl9
	bDlEM44sZXwFMub0zqekIpPmm8RkUjcc5D8yl7qVG21jCJ843FnLxXwE
X-Gm-Gg: Acq92OHunKjbYpXlVCROrk2RTh6KoVWxhqhZyGzkfypdgBo725uMwDMas3s/QIIgDxT
	eSk+fkU4+XVFoSXxnw6aBPPlxVDLEOvrVy2Jd9fp7nCcF+scdjNfbSLDhCqXK1W2nWqbzOfJqjf
	1nUIZJSK93Vd6vP+kwAESaVECPJcYDugkkScQgTVsWVsvdwy3WBItuV68vL/wzvOMm2OtnfWK8e
	u5JvdoizW0LfeiVR5GujlPZw7UYJaqfVWwWPzZJ5ttVgkoTG3pxhWpA/pb9axEEC4JtzabPntdx
	Kfj6NLYWQiIVKmUQLdl7M7tZsvzalj8K4r6JOOqbjbT+vZk6YoZP0hOcJEFzLVui5SnDya5z/Wk
	6Ssh7WsJaLqcNJShBEs/kANGdAUJlkmnqEkY1ypM+P+vvlVDfyCp+IzBnHh+Y1p9zNgbBZlzzNw
	VMUfka48/HsJ7/SBZa8OsfV6PfaQP2Y+jGEeOhYIJ/ecE9Xlox5+BNYXRtbw/Q
X-Received: by 2002:a05:6000:290f:b0:43e:a75e:352 with SMTP id ffacd0b85a97d-45e5b73b1d5mr4833404f8f.4.1778837053558;
        Fri, 15 May 2026 02:24:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768acesm13910437f8f.7.2026.05.15.02.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:24:13 -0700 (PDT)
Date: Fri, 15 May 2026 10:24:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zong Li <zong.li@sifive.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, debug@rivosinc.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: cif: reduce shadow stack size limit from 4GB
 to 2GB
Message-ID: <20260515102411.4d3e868a@pumpkin>
In-Reply-To: <CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
References: <20260514075036.1432352-1-zong.li@sifive.com>
	<20260514095605.2c7d8761@pumpkin>
	<CANXhq0rY8wb-0x2whLGMSuWLujtZwrEsmpWh_PUhxoZ0gpA96w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_022415_893859_B0712409 
X-CRM114-Status: GOOD (  15.16  )
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

T24gRnJpLCAxNSBNYXkgMjAyNiAxMTo0Mjo0NSArMDgwMApab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgoKPiBPbiBUaHUsIE1heSAxNCwgMjAyNiBhdCA0OjU24oCvUE0gRGF2aWQg
TGFpZ2h0Ci4uCj4gPiBJIGFsc28gZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcmF0aW9uYWwgZm9yIGp1
c3QgLzIgYW5kIHRoZSAyRyB1cHBlciBsaW1pdC4KPiA+IFlvdSBuZWVkIDUxMiBuZXN0ZWQgZnVu
Y3Rpb24gY2FsbHMgdG8gZXZlbiB1c2UgNGsuCj4gPiBUaGF0IHdvdWxkIGhhdmUgdG8gYmUgcXVp
dGUgZGVlcCByZWN1cnNpb24uICAKPiAKPiBEdXJpbmcgdGhlIGRpc2N1c3Npb25zIGFib3V0IHRo
ZSBBUk0gR0NTIHYzIHNlcmllcywgY29tbXVuaXR5IHBvaW50ZWQKPiBvdXQgdGhhdCBhIDRHIHNo
YWRvdyBzdGFjayBtaWdodCBiZSB0b28gbGFyZ2UuIFRoaXMgc2l6ZSBpcyBoYXJkIHRvCj4gc3Vw
cG9ydCBpbiBtZW1vcnktY29uc3RyYWluZWQgZW52aXJvbm1lbnRzIGxpa2UgQW5kcm9pZC4gSG93
ZXZlciwgdGhlCj4gc2l6ZSBjYW5ub3QgYmUgdG9vIHNtYWxsIGVpdGhlciwgb3Igd2UgbWlnaHQg
ZmFjZSBzdGFjayBvdmVyZmxvdwo+IGlzc3Vlcy4gQXQgdGhhdCB0aW1lLCBhIHBlcmZlY3Qgc2l6
ZSB3YXMgbm90IGRlY2lkZWQuCgpJdCBpcyBvbmx5IFZBIG5vdCByZWFsIG1lbW9yeSBzbyBzaG91
bGRuJ3QgbWFrZSBtdWNoIGRpZmZlcmVuY2UgdG8gbWVtb3J5CnVzZSAoZXhjZXB0IGZvciBub21t
dSB3aGVyZSB0aGUgYWN0dWFsIG1lbW9yeSBoYXMgdG8gYmUgYWxsb2NhdGVkKS4KCkJ1dCAzMmJp
dCBwcm9ncmFtcyB3aXRoIGxvdHMgb2YgdGhyZWFkcyBjYW4gcnVuIG91dCBvZiBWQS4KSW5jcmVh
c2luZyB0aGUgc3RhY2sgVkEgc2l6ZSBieSA1MCUgbWlnaHQgZXZlbiBnaXZlIHByb2JsZW1zIGZv
ciA2NGJpdApwcm9ncmFtcyAtIGlmIHRoZXkgYXJlIGFscmVhZHkgcmVkdWNpbmcgdGhlIHRocmVh
ZCBzdGFjayBzaXplIGF2b2lkCnJ1bm5pbmcgb3V0IG9mIFZBLgoKSSd2ZSBub3QgY2hlY2tlZCwg
YnV0IHB0aHJlYWRfYXR0cl9zZXRzdGFja3NpemUoKSBzZXRzIGEgbGltaXQgZm9yIHRoZQp0aHJl
YWQgc3RhY2sgc2l6ZSAod2hpY2ggd291bGQgb3RoZXJ3aXNlIGRlZmF1bHQgc28gcmxpbWl0KFNU
QUNLKSkuCkkgZG9uJ3QgYmVsaWV2ZSBpdCBzaG91bGQgdXBkYXRlIHRoZSBybGltaXQgdmFsdWUg
aXRzZWxmLgpJbiB3aGljaCBjYXNlIHlvdSBhcmUgdXNpbmcgdGhlIHdyb25nIHNpemUuCgpCdXQg
Zm9yIGEgdGhyZWFkIHdpdGggYSB2ZXJ5IHJlZHVjZWQgc3RhY2sgKHNheSAxMjhrKSB5b3UgcHJv
YmFibHkgb25seQpuZWVkIDEgcGFnZSBvZiBzaGFkb3cgc3RhY2ssIGFueSBtb3JlIGNvdWxkIGVh
c2lseSBsZWFkIHRvIHJ1bm5pbmcgb3V0Cm9mIFZBLgoKLS0gRGF2aWQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
