Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51924C35FFF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zO+2eL39gAU7fLXvx+HSpGdyt4gzDBKXSoHEa+GKqiU=; b=CeSJrSVoD/QqtG
	xNA7AAb99m5FtYyuVyL94Tk2DDazIz5nxE0rrocBcdAMIhK6KFgBNPFD4hP6NTicCTcPsapcbjP0Y
	bNn8IbaG/Dk+mL3nY8ewgO+TZCz+L30CrO01mmp+QWY1ZpVgPZC7agOm3C5vJoRjpq9U+DeXZTuVG
	LjF3SXCFcBw/964w0bLlvci04ibvxuoPLWoZwbCaQc4b9havTFLHcmJC/CDgZirqEI24VtKRpisKx
	tOYskLyK9qFqeVu/bhdsHrwu5mYsvTFfHxoNfqkM+irtKVlLeLo8nT0Uby4uvdhsLQCnGumMmj+Sz
	DqO3y5cewE5qH4I/0nYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJA0-0000000CjdH-049x;
	Thu, 20 Mar 2025 16:54:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJ9w-0000000Cjc8-3STm
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 16:54:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742489658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qzs7lXSCEOdVamoYUmTO0qwA7wo38Km/t3XnMT38O6g=;
	b=gh3CG3zvQ9zPm+A1QMUlCUXvCJyIejrTzxGfDmTrcLM7oORcFsPyEJvn8yBlQeKsVdvW/A
	R0nXLkFILH/3MWGlZ/0z/dNpz0NzkyRtxjaHVPoVimiaVdtQ1LD6EEKdBha4T8wuSb/OZr
	pkyRWOEUTlWYzCIIV3YDDIQDCe1/v+c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-AshJ7c10PHqjX_i-htNnXw-1; Thu, 20 Mar 2025 12:54:17 -0400
X-MC-Unique: AshJ7c10PHqjX_i-htNnXw-1
X-Mimecast-MFC-AGG-ID: AshJ7c10PHqjX_i-htNnXw_1742489657
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39143311936so521207f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 09:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742489655; x=1743094455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qzs7lXSCEOdVamoYUmTO0qwA7wo38Km/t3XnMT38O6g=;
        b=rV+/7uoN25+DQLzZAUIL29j1s0s06cRNXvK58DE9T9OwHgKp9xDfVUxTtoVbeJbbyP
         GLpJg/jiiq1T/uD0J2UYhgb1JWXM8VG1YwKwa2PCaRLyNIEFoltrIxG0TE9bp9tYg1nY
         PHzS8f5uIV9teWv4K8XfwmQBfs4YrZGkq8//eQhUirVe2UKwGntj/zdU8Y4ff9SGMp4Y
         aUZMGcSBaHhgrRMuy3NfEZC06UD1jcSBi5hRH5cJbu0RZ8jRTqCqPmb/VI7ZRC6zajGb
         xO/i0kIBSpc7PZahPLqG3eF8sIaeaP3cuB/hB2pA40Eyd4wIdA4obPv+JeyTAZ1TrFNI
         Oaaw==
X-Forwarded-Encrypted: i=1; AJvYcCVmkBjciX5xwZ6MqVh4qD4v6pOJOSTqAsVDNQ/Ea1VjqMTKB78cW6YCTZE57rr0y15O7LlCnhwMhYbPFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFyslnNwPMCKJliQk6izDpbE1gcV8OYbvEu3q4QthFQFqlKEup
	TgjuL9BrpXM7f9NdBJGGiTjCwQ1DN2qpmBAKLvi9Zud0NQojfZtIuemXgAFImfIVRHhQn0x/qXZ
	XylWtLee84zasv3NcIjWQNjNjEjSsaSB2fDAgxeRl421TtDlawUlna/8oVI6Assa6vWK/2sHlmQ
	qpaweoDFfMZz7uJrD3O/ELUOMIIM88SAvIXIpK/aIBLFytSn9+
X-Gm-Gg: ASbGncuaZADah/w7BmIb+tRBO3guG/EDx2EPOaYlVdR96JhDc1ko7fv6i5+wOaNuE4h
	QTWupC/SX3wbUCBkBIvHlQhZgPUpJm1SmUpxDbvXyIiz60Vwuud1V8RjoNUy07utiPCRngbH/Qw
	==
X-Received: by 2002:a05:6000:4188:b0:391:4999:776c with SMTP id ffacd0b85a97d-3997f932c74mr219916f8f.40.1742489654945;
        Thu, 20 Mar 2025 09:54:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj9pl7GARtWFq3jbXWirX8oR8zmkq+Vb5cM05rQzCwUuLwhvW30WXCS+Nl/XDDl7rMvPzTyG7iVBUS8ETq7S4=
X-Received: by 2002:a05:6000:4188:b0:391:4999:776c with SMTP id
 ffacd0b85a97d-3997f932c74mr219900f8f.40.1742489654526; Thu, 20 Mar 2025
 09:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy380StEE03G=RPjKoxtY89nLeufpXbjYwbRypzzrkQN+g@mail.gmail.com>
In-Reply-To: <CAAhSdy380StEE03G=RPjKoxtY89nLeufpXbjYwbRypzzrkQN+g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 20 Mar 2025 17:54:01 +0100
X-Gm-Features: AQ5f1Jp_WB0jgmaoJDDes32ApEWmT6Y0Q3VLmJo-2VN8hWbZcGCzV2rcn3utTOA
Message-ID: <CABgObfYbgLN6aqDYTXq=t2G5+KsHjUmdFFCuwmzdEZSVDTrOxA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.15
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HBbZpkn3MNzIL3CzPFz0xrQnAxJ1pJTEfX6Y6pV9hAQ_1742489657
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_095420_927429_169AE46D 
X-CRM114-Status: UNSURE (   6.47  )
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

T24gVGh1LCBNYXIgMjAsIDIwMjUgYXQgMzoxNeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBtYWlubHkgaGF2ZSB0d28gZml4
ZXMgYW5kIGZldyBQTVUgc2VsZnRlc3RzIGltcHJvdmVtZW50cwo+IGZvciA2LjE1LiBUaGVyZSBh
cmUgcXVpdGUgYSBmZXcgaW4tZmxpZ2h0IHBhdGNoZXMgZGVwZW5kZW50IG9uCj4gU0JJIHYzLjAg
c3BlY2lmaWNhdGlvbiB3aGljaCB3aWxsIGZyZWV6ZSBzb29uLgo+Cj4gUGxlYXNlIHB1bGwuCgpQ
dWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+IFJlZ2FyZHMsCj4gQW51cAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
