Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5579DC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saWaE+BfsAobWu0Ftd+uchVf5sMFLgICVv9u3nwcmZM=; b=MaFU2spsNBOTmP
	z93CvmKhRWkPA7sABxINMv8sOwAVlEGN3OIqVCXaW5aK1e/ex0inMcr+2aYIbpPDOHSerhY34MA6J
	P7uAwOJ/iYp5kqZeJYlqNmGb7sS5RBdyjMzu5opWm1AKI8x2EvQpW0l03rd1AAHT20+lKlz8UFsSO
	3+iJGeZLJooFPIvS0gXoDDW6xCIY6IuWBRPiueYrmV/aP8+BKhE+bRGapyQVrPDckW8TLPCXTjnt4
	jGNrDl9Om2tS84ej9Z9Ix7SnsIMxraX/01oLkyrw2jNDWEIj1ZIzIizgw1PwTzLC9QJA4HYlnjpgq
	E3jFCU+13Z4RR/aV1EQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKhaH-0000000A12u-28Uk;
	Fri, 21 Jun 2024 16:57:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKhaF-0000000A11a-0tRq
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 16:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718989074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=79G3j1alGKu1Ed2Tiohf1Y+b4uxS4/8Rze/yiGQx1k4=;
	b=AEl+GPOqOAlLN9/gurhOuQ2gBMlT4j2ESXTgVoepBdZfs5vB+4FJtEJUmtEZfdxBU7Iopv
	XU4D2Nli6EZdIuzV54MGvK87Z4gUI7VBZ6e4JNfyP0T6GecvaZM+G3AiX1wTlgje8JlqMV
	cP2TjlJ2OLqpLDxNMGRGitFw5DFO+y4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-v4yt_mhrP3ySXKFrPiH4_w-1; Fri, 21 Jun 2024 12:57:52 -0400
X-MC-Unique: v4yt_mhrP3ySXKFrPiH4_w-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3653f54d94eso916062f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 09:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718989071; x=1719593871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79G3j1alGKu1Ed2Tiohf1Y+b4uxS4/8Rze/yiGQx1k4=;
        b=V02VU+M5+c0jlI4uzKBie4CgjAWSdU3OHZUncvhDQIypViNnNr3OxRVlCrOv2I8EGK
         zFykO6kjtf1/zzDBV8sM5ExBKFmvJmQKyi0HW7b7Usya3qpfx1PgRIllkkP0FZmBYsr6
         Kv6KP8VWNjq1lR5KYRYH126Kiav7C/TpMJ0r5Hr6g/g/wT83aszbojxT4+ZkrsM6GCph
         baE5Q2yg7gSxB5uCeh/ewMm9urDhPwFG86bBrq4RDdYDHjzRXsroCUvs5l/qg/w7m2JH
         3E9LkPe3mFldK5zRDdgwuKwxWMBacDA3I8sPR6wegGkTHnKTbrtWbVWlZPJwziwGqClq
         +U6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX57y9DRa+/tI7NJ8sN7yux9NH7rxP+bXLlk5u6pWZkWLbWsD4NyHaAnjPcVTmq79gzB5PjUNLt1YKlLdPv4VXERWfgEwg2ObSNYB5kkVSm
X-Gm-Message-State: AOJu0YzwMiyF7Q6hg2aGVaE4d29V2LxUkyW8djLxUj8V9HReZR1T+r+u
	Br6dXpwoEDyDCrwee5cneeZzZnD9wohWjsACpGlja9TEygbmJJsN/2T+6PyMgZf8j4z/fVMq2DD
	re8fy3+qrvNzgJZHyHT4qlK0ulNu2BtbidB22DO4WWqff3o0zQTOu7DFU4+xW+CGxjN5TistlNk
	h8SGjwQqgRdCbPDcDji41Uf38JfVIxacw0ELOaGxlV
X-Received: by 2002:a5d:6783:0:b0:360:791c:aff2 with SMTP id ffacd0b85a97d-363195b234amr6006933f8f.47.1718989071281;
        Fri, 21 Jun 2024 09:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkHbLlH0w9F69hASfuJKg+82uIi72lfMrpHnmS4F+cyOECiBz7FgjhlTMoe1Vs6ubjQ73Zp7rx7uw1c2rlp1s=
X-Received: by 2002:a5d:6783:0:b0:360:791c:aff2 with SMTP id
 ffacd0b85a97d-363195b234amr6006918f8f.47.1718989070973; Fri, 21 Jun 2024
 09:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0wc=e5LW92Y7YdK6Bi0cxk6C1EhSyv5vMo1FxKMu_CpA@mail.gmail.com>
 <CAK9=C2U6Mctz6fMOVQroDUHeCJf6HPGrKkK35BPeTkPAx2WMfA@mail.gmail.com>
In-Reply-To: <CAK9=C2U6Mctz6fMOVQroDUHeCJf6HPGrKkK35BPeTkPAx2WMfA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 Jun 2024 18:57:39 +0200
Message-ID: <CABgObfa41Ui5qxUGR-Jw+UueuM9U12bEEBwG7wEPSDjQ4gaArA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.10 take #2
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Atish Patra <atishp@atishpatra.org>, 
	Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_095755_339112_B8A207F1 
X-CRM114-Status: UNSURE (   6.59  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgNTo0OeKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPiA+IFdlIGhhdmUgb25lIGFkZGl0aW9uYWwgZml4IGZvciA2
LjEwIHRvIHRha2UgY2FyZSBvZgo+ID4gdGhlIGNvbXBpbGF0aW9uIGlzc3VlIGluIEtWTSBzZWxm
dGVzdHMuCj4KPiBGcmllbmRseSBwaW5nID8KCkdldHRpbmcgdGhlcmUuIDopIFB1bGxlZCBub3cs
IHRoYW5rcy4KClBhb2xvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
