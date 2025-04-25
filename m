Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05759C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=he874x9ItDx6ERCM3CK1cfT/w3oDr2o5xT8jFEuXS3E=; b=UdOcSnipPhVaGC
	l9rqCBjpsxwvSqkF0dlyNOqEwdNWh8TgyN5z+c84Bw9KukfTY4H86momTDUjHZsELmaeIoHPtDIPe
	B6PnQEPcyZ+GJOHyoNYVjUxQR1pX+y/5cr5sqQzRjweuYUp768EoSJ8F2FdSXL8fiWzKxiyYJZBie
	zmuuCzR25S796ya3pWUFpsBWnT8VQsBCxrRJo98NskTTeKOk60BYF1U/jh259TpBRBkNWSK8CzBqG
	BsbmD6jerHf/D0M9pDhKMaiZRyFii6xYdWadNzL5Lo2aPvYewJz21wgK1FGWMI3GLg/llgokxu+jk
	TtsLgn63CnXYve6nHimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J9K-0000000HHvY-2CWV;
	Fri, 25 Apr 2025 13:31:26 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IKM-0000000H95M-3pJM
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:38:48 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so17782085ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745584726; x=1746189526; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y49ecCcPZ27vKY56UjG6VNDfh5EOeWUeZzzvy6PanTw=;
        b=25sbKMOiooZcJqI+fzWXANcwrRpOp2aQN8XL9PoJ9+vKxd2BgUnjyGi+89i3QBp6LV
         7lOn3RMMLwl+T4kTV6age6Zd6x3aT5pM+b1Kg7UI+KwnjBl95ChNA9+26y/ghZntvLP3
         eWkQV0y/FHjxziygJrdUXzS5CE5C4npeO/fPyY2v7TP8LhhNVpSFNx05bWNOgwxa0cm1
         rbOnxPojgq+HTPuyYTAlia3RDFMRBFpBwxTp5LdgIyevQ0TLK3moagh6sks0E5a0YIfU
         kX1Q96+79ygxK0K4tWUgfskQBkV/SYs1lvmkGQIbasORgsyH+BhlrWfcR5nTYzWMfCVU
         S47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745584726; x=1746189526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y49ecCcPZ27vKY56UjG6VNDfh5EOeWUeZzzvy6PanTw=;
        b=edWmOldT4kpnXiF4BJ48dl96SEgxe/AiJ4pUoQgM8FZClqUdT70qcVKlp2t9JvUI7V
         L4gaG0TBWzBmk5r4EbZyZywybz3oDj0ujYSUxSrZS9u1BFTiO+t+zYQIFOEHZOC9nNMb
         gHnBNuhsPM3y05Kx16TiTA7dgkwhZc7vYfKhF1azf8tE6SDUSxobDKeLFSczfS3NKGBH
         7keHbRvP9NfBAN0so35HBSpI3GCUegqZRAtWxpwk13+B/XgpW/aDM+4z7tkNa5bAR3CL
         uNAAYvIbzByclyRp86zAbb+wGKbHIRFR+wcTgM7AwbQqfXhvIiHJkLU5cMqlpP8V+v5V
         sJzg==
X-Forwarded-Encrypted: i=1; AJvYcCVCKJD4j1SWRKPh/yYW1s7DiFPAEeEdclkLKFhUKaWOj6wYzbCW0lAolMLTWgnf9U/WKh0w4gsCvh+Fdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNbacMCrIiXDzASu04fy9C1A7IysyXQObYLlUVpOodHLCaUq4b
	J3Rt0UAyQdZTvG/vmeydvwCDjkmN6YU+1aXAiJ+w9X1EMAiMxw5PwNkfZ/0RlkI0xVX1Itjc+rS
	7xgTn9pmBznD1k2hfCFtBICjsNlZo0+tiLJVC0lKOm0ErXWxpjpY=
X-Gm-Gg: ASbGncu5qOhLTbrzdpF5QFhyC5YEqXxUqXJHfLqgQR/sXs+NDOF56r/7udL/QBUILbN
	L0J5QX6Z/tVDqxfYDXz4zjnnzqnU8epf13CkxU6jDhOy0CsYKEVJkuc9iX5q7TadRF2yn8zmtDb
	0/VZTvrdWAJI3C6ZtHqTkJvfdPQWijYq79Xw==
X-Google-Smtp-Source: AGHT+IHCBpc2B5Wy9lcw08NfHNFF6DJA1zf4wJ9kwK39XfuRau2F7l0ThkxP7bLnPHEwO5HGzNURDb7ye8N+KXdSdhA=
X-Received: by 2002:a05:6e02:160c:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3d93b46c840mr18166585ab.11.1745584725718; Fri, 25 Apr 2025
 05:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com> <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
In-Reply-To: <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Apr 2025 18:08:32 +0530
X-Gm-Features: ATxdqUGBDZlnKKA6uFKMGKbX7_uvZC9RQt2w-oNtOWxKHL92YM2ym7Hd58gV9nQ
Message-ID: <CAAhSdy0+C34zZbYR3_B9x6xHihwfLxeTBOfrdRfLRjFUN=78gA@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: RISC-V: reset smstateen CSRs
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053846_952729_1DF0436D 
X-CRM114-Status: GOOD (  13.80  )
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

T24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gTm90IHJlc2V0dGluZyBzbXN0YXRlZW4gaXMg
YSBwb3RlbnRpYWwgc2VjdXJpdHkgaG9sZSwgYmVjYXVzZSBWVSBtaWdodAo+IGJlIGFibGUgdG8g
YWNjZXNzIHN0YXRlIHRoYXQgVlMgZG9lcyBub3QgcHJvcGVybHkgY29udGV4dC1zd2l0Y2guCj4K
PiBGaXhlczogODFmMGYzMTRmZWM5ICgiUklTQ1Y6IEtWTTogQWRkIHNzdGF0ZWVuMCBjb250ZXh0
IHNhdmUvcmVzdG9yZSIpCj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+CgpUaGlzIHNob3VsZCBiZSB0aGUgZmlyc3QgcGF0Y2ggb2YgdGhl
IHNlcmllcyB3aGljaCBjYW4KYmUgYXBwbGllZCBpbmRlcGVuZGVudGx5LgoKSSBoYXZlIHJlYmFz
ZWQgYW5kIHF1ZXVlZCBpdCBhcyBhIGZpeCBmb3IgTGludXgtNi4xNS4KClJlZ2FyZHMsCkFudXAK
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCA0NTc4ODYzYTM5ZTMuLmFjMGZhNTBiYzQ4OSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1LmMKPiBAQCAtNjUsNiArNjUsNyBAQCBzdGF0aWMgdm9pZCBrdm1fcmlzY3ZfdmNwdV9j
b250ZXh0X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgbWVtc2V0KGNu
dHgsIDAsIHNpemVvZigqY250eCkpOwo+ICAgICAgICAgbWVtc2V0KGNzciwgMCwgc2l6ZW9mKCpj
c3IpKTsKPiArICAgICAgIG1lbXNldCgmdmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyLCAwLCBzaXpl
b2YodmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyKSk7Cj4KPiAgICAgICAgIC8qIFJlc3RvcmUgZGF0
YXAgYXMgaXQncyBub3QgYSBwYXJ0IG9mIHRoZSBndWVzdCBjb250ZXh0LiAqLwo+ICAgICAgICAg
Y250eC0+dmVjdG9yLmRhdGFwID0gdmVjdG9yX2RhdGFwOwo+IC0tCj4gMi40OC4xCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
