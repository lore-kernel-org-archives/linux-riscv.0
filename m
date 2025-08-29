Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CB2CA0FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 19:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXka8AJU9U/53VY8Ka8kH4RSossONOKfYrocslPed04=; b=L/s+IGe/qmOv8I
	3ZfmWovMVaNGVEthq/Q4s7Vn9jIOqZ3SJOqEXqKKkkPL2bGa3HtRN6li1b4ayRmhkZkq0kqPOehRU
	MNXqskdvua8UEjBTqEsrbUPCnk9ves2x12qgkj4DCSKx9uWioZglUPyuGJsKQwmitYDIkWHn7cvGV
	p8BXHgl2nV5GOr38h/Nd8zvCRCKazLPnpCRK/RYk7KpXZrkJ8CnYNXnrLwdkSpt2/O/Y5lAfzCImz
	7Z1NyGUeek02NKzRqT7ULoMeVfMh2bneAX9W9cu6pShVZM7vbnV8zG6R14HAWT9CGxayXr2bHCvEQ
	5oJEYNYxthjk1lqRpj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4vN-00000006mcy-3mcB;
	Fri, 29 Aug 2025 19:38:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2Me-00000006Sgn-20mH
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 16:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756486450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MEXEQ52BMDj9IaYiI6bg5Gi6IB7kkAuqnXds+BbFlw8=;
	b=IwjQeagR+BZyY9ZYG/0YK9S4mkaC+0fWqpx5GcZNLY/ELkjny90YsXjKh1om9fYtpIy1/B
	5OK1sDIzxDq3wV/MHi38yIGHN2K+btvIwuIVmT8qB58x5UP4JcBZEPguqYKXp8qDijbDel
	yD5VQXGiQrfF05E8U4BVhpnoT2xHStY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-7v-ClGc-MmemEgyqoTeuGg-1; Fri, 29 Aug 2025 12:54:07 -0400
X-MC-Unique: 7v-ClGc-MmemEgyqoTeuGg-1
X-Mimecast-MFC-AGG-ID: 7v-ClGc-MmemEgyqoTeuGg_1756486446
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3ce3e098c48so1223680f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 09:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756486446; x=1757091246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MEXEQ52BMDj9IaYiI6bg5Gi6IB7kkAuqnXds+BbFlw8=;
        b=sLjdOZxsKkzJMAmqS92E6uPwxxHaqLUzYPmur2+XwzQVP+KiEefwzQAhRQKguNWQfd
         SmRKtE1yRyOdcibuN1BeceFHGnEZss8x2qZGOYtzGCIqBJW0DA5wlwzSTIailmN4BTc+
         r8tHE6SS+wLaycYUiBXhxxX/45LZ01Mp3RVfgwlBENer6ZqM220+34lMmcL4gQBzzPvo
         E0RD+WSNR+8VAfA4m42VyZC19x4fhQt/YgoT/OjYloQci28rjT/rOSjqbA7oflNi9wxd
         ekzJ4LrPaCsQHJ/UOyt0ZbuKoFvjDk170pAao/CkgIDdQLsgH7wKt+41Dd1TZTYeB4H8
         gQrw==
X-Forwarded-Encrypted: i=1; AJvYcCVc7podaojkHGTOKZX60DannFIzeEfjUO27hfeqOHHpxwkKDE8MBv+IOJPaTPjESDV8lo894Nr77Sl/3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKf919kYhUTog1dk5tEytCv9kJXhAC10HiSChSBhsu0jp6njnP
	Uk0s2nMNy0d8iAOBbKv6I7HW7qSrQQj94HiSnsaH56m+ROE+m2+u/aozOtHUzS48q/upnG9SPX4
	ofjCfvCnx2DEYG/HHmT/OcNWyydJrLc1JcBbeq7cnd7S+ozvg2sPucsE0Ubh9an7JqZQNRgtVnF
	h1FLzflF54UuIfmchgvXd+eccbnwzcrbDzQEo/o7AdTnqS
X-Gm-Gg: ASbGncvojL5gNfZoymrodz+Ru39EeHMYTEAXbZ+ZXDK/qM6FlnH3IjyN7mjWnuXlsqL
	11k0xWpxh5KdIlMCFcjepp9horMdsXgRZFWnkXGwLjkok3PYLp46C7ACOGw4Hzj9/V+LRjuOWx8
	FFWj5DV6gb6rIIPN+mI6fCsS/AfRNjk6wk5YGYmT4nZ1rbcnitEuYGvOo2BYd3F+sXgC59jUGan
	nzFanT0m+uQS9iup7QDmFKa
X-Received: by 2002:a05:6000:26cf:b0:3d0:affe:ed78 with SMTP id ffacd0b85a97d-3d0affef23dmr1993386f8f.48.1756486445950;
        Fri, 29 Aug 2025 09:54:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdPZurYZfRUBnVOaS3PNxkM1C7NRZdnWpueO3B3+j122HOFXUPtz6Qia0NiP/HNj/vT0GqByycZDJiM0JglWc=
X-Received: by 2002:a05:6000:26cf:b0:3d0:affe:ed78 with SMTP id
 ffacd0b85a97d-3d0affef23dmr1993361f8f.48.1756486445512; Fri, 29 Aug 2025
 09:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0c5tScwHk8iLoF39dxFUSLg1RzST9=4EQ3C8KogvbM6w@mail.gmail.com>
In-Reply-To: <CAAhSdy0c5tScwHk8iLoF39dxFUSLg1RzST9=4EQ3C8KogvbM6w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 29 Aug 2025 18:53:46 +0200
X-Gm-Features: Ac12FXyqjT6P2FLFlcMv7sZgiRuRQCFuk8fcYFJD6RjPe2yyKjWPc-kMv7i27Zw
Message-ID: <CABgObfa6b32FtpDwe-DDqHF_xx9vwePKj2CtN7wjG5s-pU2uMQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 6.17 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gY58oJfrLzaB8spRnG5ivDqdoFkfBZWN1mCbwxcod3I_1756486446
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_095412_583035_ED2D8097 
X-CRM114-Status: UNSURE (   8.69  )
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

T24gRnJpLCBBdWcgMjksIDIwMjUgYXQgMjowM+KAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRocmVlIGZpeGVzIGZv
ciB0aGUgNi4xNyBrZXJuZWwuIFR3byBvZiB0aGVzZSBhcmUKPiBjcml0aWNhbCBmaXhlcyBpbiBr
dm1fcmlzY3ZfZ3N0YWdlX2lvcmVtYXAoKSBhbmQgc2V0dGluZwo+IHZsZW5iIHZpYSBPTkVfUkVH
IHdoZXJlYXMgdGhlIHRoaXJkIG9uZSBpcyBhIHRyaXZpYWwgZml4Cj4gaW4gY29tbWVudHMgb2Yg
a3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHMoKS4KPgo+IFBsZWFzZSBwdWxsLgoKRG9uZSwg
dGhhbmtzLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
