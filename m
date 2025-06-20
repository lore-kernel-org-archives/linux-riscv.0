Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA97C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCnZejUrFTBtGdVDMbijFGiNVXbmgZcSpoC+e+NCvYQ=; b=UB7vU8mK9Og3vd
	d1TVGpuscNXRuUdCGHyVic6CUwlcQSYvORRqI6yyybEDszgBfwU1uqb9Erln7InanJZzpX6HE4Amu
	NL2L74kd7RLkUDKDPMsSOhlVX5OEGd84lAnnHYTNZD++bpavly21eVh7sYZ4pZGw3gYFbLRNmYhHQ
	DUIgPogObV2BSK/s8xFBmDv3GcUxSlZK4lodD3/ORgRIpK787x4ncJSbL0A7npFUR1GoiEFpp0Mwi
	4qkbv7AjpkpAibIWiZ4Na9LH9quCeqbVTjwMEWjOQlWuqQiIHsTbjiNNpHBXpIUCrbk2glGf+aFiw
	MIU81krrY20PTgMOZsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfFX-0000000GCfr-0tNS;
	Fri, 20 Jun 2025 17:09:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfED-0000000GCYn-3GM7
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 17:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750439314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r2JhiJAXkhU14Ll0oB1qiziLeU4ZWAaHmGVdfC2ondg=;
	b=ci7iFSHPot8XPMfAbdRDpON5E8NMyb/ktcOfS7oWHJUz9Z9nnKV3OKOt4mK2dB3EgAYKZ5
	/As03OWhw8kIHbNBq2/OLbt9XclaY5RcHEdZE6iVhiczKWc2z0ZAvRAQ57h+d0J/lN93H9
	C9R9j1X3us2sBXfFLn/pYwBeTBWU4iw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-5x1QWNuDNsK0NJOBShgQRA-1; Fri, 20 Jun 2025 13:08:33 -0400
X-MC-Unique: 5x1QWNuDNsK0NJOBShgQRA-1
X-Mimecast-MFC-AGG-ID: 5x1QWNuDNsK0NJOBShgQRA_1750439312
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so1157768f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 10:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750439312; x=1751044112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2JhiJAXkhU14Ll0oB1qiziLeU4ZWAaHmGVdfC2ondg=;
        b=tL4aFnTSjBV0APybAP4gdFMTtcg8C7LqOfAlzJsOoX7KXguXVDeAsn8Y7gr1h2Aayh
         eVlx/G9Wb8ECLGc5Qm3DDaUWzKX3cVI/HmmUUx1weffK1lAF/M2+9cdgTH8urxftNfRp
         8hyMIyitUXjDZ9xJkFmHuoj1gN5atLJBDAEbFJvuOd04ftU9VGFRNoOb7Ui9CIQ7qh7n
         etieRXZvGwb5ImdYtc1XiWi7bRjO2ZbQ36o0ACFm+8sWtrgO7v0OzMCSOwJfZ4J4QKO/
         uZTRlKBMXepfeVut1vQKgAj4g7fOWh71ay18a2fBjmzRY5KwmnOmF4e5X+hUbvru+196
         6zTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPGkxYK11clPGCXK1bRugG+iNCEDXUXHFxZnNO6YvqveGTwJt+t4zazjxYn2j+CM9cQ0ZRsYkSul6Yeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVzYFD4RJRh1F/6BMhg+/zTVj1Y1VLOiKZL1wqR5ZeUPy4ZHBx
	zc7VCbuJ+tvqp5BACRis1NfS+DutVXy5xEkpiFZqQBQQpvOgM4rP6F0CS9/7xD6ZIBaEWVtNdpk
	1SYxvQ8yk99S22cyFM9Z6BciBYaSVcCARFERG07rHOuRARq30NcvWINdiAUVGOecu3fs++Q/c3d
	+Az4IP1jIhBzmhaa9jKUt3V3innHymCzdUERpryT0CZuJv
X-Gm-Gg: ASbGncviv9bhVLuVqS4G6hZEKFH+c9pT6evgMIGLdO12ZvV738mK0S1sJiYKRGbY0EY
	Df3v+R/wrQjnqNr5zhmFOSAAtwx4bUo4pCYgaxDCz1G3eda1ryLuQAc2VWqppgYCEh2+UgWUp67
	jWGSA=
X-Received: by 2002:a05:6000:4028:b0:3a5:27ba:47c7 with SMTP id ffacd0b85a97d-3a6d12eb400mr3172670f8f.48.1750439311811;
        Fri, 20 Jun 2025 10:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7IiJVica4CS4GrLqH/peAyHZsEjszEJMo8N5OhMmLN0zTZVLBNwPF+ffHrcbwAch+4I3rcLG9lKHNtCYnJX8=
X-Received: by 2002:a05:6000:4028:b0:3a5:27ba:47c7 with SMTP id
 ffacd0b85a97d-3a6d12eb400mr3172647f8f.48.1750439311454; Fri, 20 Jun 2025
 10:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2ZTWpx82buvGmcTp+0bXJCncQ8TCdmW7tCMC_P69GBeA@mail.gmail.com>
In-Reply-To: <CAAhSdy2ZTWpx82buvGmcTp+0bXJCncQ8TCdmW7tCMC_P69GBeA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Jun 2025 19:08:19 +0200
X-Gm-Features: Ac12FXxYI2NgPN6AIYShUhEnPB6Bl3WgJoZhauSYbs8tPxyDZoJzys7gQd2IPaA
Message-ID: <CABgObfbTtTRYyTHbP7sduZFkB31EDvRmSAJKpQHcNugjAALV2Q@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.16 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aNiDt2yUvc7VCfyhqFxV7gBpSTMneDTVowg-fwsG1VU_1750439312
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_100837_877444_4E70E2CF 
X-CRM114-Status: UNSURE (   7.09  )
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

T24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgMjoxOOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHR3byBTQkkgcmVsYXRl
ZCBmaXhlcyBmb3IgdGhlIDYuMTYga2VybmVsIHdoaWNoIGZvY3VzCj4gb24gYWxpZ25pbmcgdGhl
IFNCSSBSRkVOQ0UgaW1wbGVtZW50YXRpb24gd2l0aCB0aGUgU0JJIHNwZWMuCj4KPiBQbGVhc2Ug
cHVsbC4KClB1bGxlZCwgdGhhbmtzLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
