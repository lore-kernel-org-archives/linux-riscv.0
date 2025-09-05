Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274B1CA101C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pO+6pg1Hc33B3PC/K/ahzcP9g9qrVolVz8bQ++pPBHw=; b=32i09sdL+r/2FP
	tYj6FiwRtsOQJorhwBpgjcra1/jp890sJaMMI8SDx9pCrh0p/BTWXLrpZlQETVatl2TZrDzI7kbqc
	soMqdBxZcS/H3JRMLxwgGD9hbAevgB+3iJa8UK8dgAjOnxzvRbfW8/OiM2wUWTJ2nvkivbykE1R+q
	U/dbjn9wK5E4a8ouNP1cbEupTJvq1WPqalGGiiagtxwvperf1ekF+P6yI4UZmG9r05SwrsKbPg0BF
	eESgiJO1USPuC4Gx8+ZMJHXF3KENwiPsyCp5xzC+AB1Xitcv5nGYJAJFa4YTwivyf40FfR/FRVnjD
	mWAGie/pBXk0gg9prwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR9z-000000007kt-1SwV;
	Fri, 05 Sep 2025 07:47:03 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQIg-0000000HOkj-3Q9E
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 06:51:59 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3f4d7feef27so12875435ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757055118; x=1757659918; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nDTd5Gv36YNMyq5Qhnn8xJEK9lVHzvftyFkSysDc/4=;
        b=XmWOTB3RpU7wIOwkfpFUooCsnO/vGACm+QRPBkM6A39jO/s3lA+ItKNgf2/bplT2zy
         4aXAOnXnZ/lbv8574zHgf/9M9wyavxeeCp2naEZedz1U6TsKM+UAlrrz4xpRxSkAF7R6
         7myqPGXWmn5drtGPhuV1n2w6NoSavhr6T9lK0KQgcBR04uzqhld27Rrp3kFfV5hiGsFP
         rEwPLrOgn84sA33vNmYV525NJJVS8TJSj51raMY+sJwW+B5uXTrg917nwMYLWRrmjiqS
         IOLvtX3GRmTOf8UN02Lh2bAW//oay731ruN5Gq24Qh6FZUAAh4Np91WBHrRiPx1Ayx3t
         RkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055118; x=1757659918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nDTd5Gv36YNMyq5Qhnn8xJEK9lVHzvftyFkSysDc/4=;
        b=rmPu2S/2SZPRizyI5QniNbB3hx3AhW/VLKBQkk9vLQKVZrIe4wLc2HWcFdp7DEaH/V
         lyWftB2WIRiD7wwIdKJeXjzrMeIunBD3jai+0INFhtZvwhfid0o4WE4z/naSZqQHMVZt
         GunwWmgJcjKN+rE3WCI0VlNCSUJmPgyY5QHNaD0TLlb6cwaopeexNI1JN21TweshYW0H
         LtcJyiBsDQIe6XPNChjH4n8bXo45wA7ekPgRPwKF4g8FjjSrk3NwdBT8DiO9WSO0Uowt
         NqazRKIjAWFTMJAljIdfH0RimCNWaK43oOFlEDkjqmk22OJDl9jvP4z8IeNzs/b7ttwP
         Zy4A==
X-Forwarded-Encrypted: i=1; AJvYcCWSusUA9lMl7GW5qqrLDUGpEecfkufCnzejinDGBLZiNPF0kIkqOs9pYTdh4KoD7jMXXzZCtk4U7OLdsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0gvuvlzhsViGctMLCpvVoAVjmYpnWMQds8r2/1/uKDndEQ5hX
	sGENSoIDBJKriVX8Iw/5QhQh/xsxfk3O/MG/fzq/nSrln2I2NoHXLQR7qkmI04Ipk5RQQ51Cd6x
	dyMNg7Fe/9zT1Wppo4Ny8LsgezIIVA4EyHP8XVN83EA==
X-Gm-Gg: ASbGnctCWA1GaJYPjF/wV2uY9JhPnnSN8xvuZGB2LgzkePSC9fInIB+5Co7OIDZg/s9
	OWtO7H5yHiDzttfzYRLtnyrebkt4BDcjKBhFMUwKQafQfcj7ry2bErigORMJ6SnbIDb9YbAtDVw
	b/KXdPmn0ipcs9IIixwYdODMeheJvqPy5aKcu5DUc0wRQr0FPUFoTdi57beIjtHGq4sFKI+V/tw
	vXa9va+Ag9NXUPgtcHNRd1yEglF93OSLPT+LtAY0i+kSvpqsFBf3BzSVrlFKw==
X-Google-Smtp-Source: AGHT+IFqhsp8QkbEH2AYxxy6aZR2+3njRKvf1EkNjHXrSfDyXXsLjXgWGyrgUdjW9lEocsZBNm6jnwrKVQArR5mwmho=
X-Received: by 2002:a05:6e02:4616:b0:3f6:554f:f83e with SMTP id
 e9e14a558f8ab-3f6554ff9d2mr206848225ab.18.1757055117887; Thu, 04 Sep 2025
 23:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250821142542.2472079-1-guoren@kernel.org>
In-Reply-To: <20250821142542.2472079-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Sep 2025 12:21:46 +0530
X-Gm-Features: Ac12FXzs-ev06L7BPaxBsQRN2id94q1V5j-qhNEmATN7a2fxkATv2aO3WzvlWf0
Message-ID: <CAAhSdy35BTE8YwxKb+1YwE3eHDfRytt71fU4014zYjwyXYn5qw@mail.gmail.com>
Subject: Re: [PATCH V4 RESEND 0/3] Fixup & optimize hgatp mode & vmid detect functions
To: guoren@kernel.org
Cc: troy.mitchell@linux.dev, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, fangyu.yu@linux.alibaba.com, guoren@linux.alibaba.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_235158_845764_7B6C773D 
X-CRM114-Status: GOOD (  11.46  )
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

T24gVGh1LCBBdWcgMjEsIDIwMjUgYXQgNzo1NuKAr1BNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBIZXJlIGFyZSBzZXJ2YWwgZml4dXAgJiBvcHRtaXppdGlvbnMgZm9yIGhn
YXRwIGRldGVjdCBhY2NvcmRpbmcKPiB0byB0aGUgUklTQy1WIFByaXZpbGVnZWQgQXJjaGl0ZWN0
dXJlIFNwZWMuCj4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+ICAtIEludm9sdmUgKCJSSVNDLVY6
IEtWTTogUHJldmVudCBIR0FUUF9NT0RFX0JBUkUgcGFzc2VkIiksIHdoaWNoCj4gICAgZXhwbGFp
biB3aHkgZ3N0YWdlX21vZGVfZGV0ZWN0IG5lZWRzIHJlc2V0IEhHQVRQIHRvIHplcm8uCj4gIC0g
UkVTRU5EIGZvciB3cm9uZyBtYWlsaW5nIHRocmVhZC4KPgo+IENoYW5nZXMgaW4gdjM6Cj4gIC0g
QWRkICJGaXhlcyIgdGFnLgo+ICAtIEludm9sdmUoIlJJU0MtVjogS1ZNOiBSZW1vdmUgdW5uZWNl
c3NhcnkgSEdBVFAgY3NyX3JlYWQiKSwgd2hpY2gKPiAgICBkZXBlbmRzIG9uIHBhdGNoIDEuCj4K
PiBDaGFuZ2VzIGluIHYyOgo+ICAtIEZpeGVkIGJ1aWxkIGVycm9yIHNpbmNlIGt2bV9yaXNjdl9n
c3RhZ2VfbW9kZSgpIGhhcyBiZWVuIG1vZGlmaWVkLgo+IC0tLQo+Cj4gRmFuZ3l1IFl1ICgxKToK
PiAgIFJJU0MtVjogS1ZNOiBXcml0ZSBoZ2F0cCByZWdpc3RlciB3aXRoIHZhbGlkIG1vZGUgYml0
cwo+Cj4gR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpICgyKToKPiAgIFJJU0MtVjogS1ZN
OiBSZW1vdmUgdW5uZWNlc3NhcnkgSEdBVFAgY3NyX3JlYWQKPiAgIFJJU0MtVjogS1ZNOiBQcmV2
ZW50IEhHQVRQX01PREVfQkFSRSBwYXNzZWQKPgo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyB8
IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMg
ICB8IDM1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZtaWQuYyAgIHwgIDggKysrLS0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRp
b25zKCspLCAyNiBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40MC4xCj4KClF1ZXVlZCB0aGlzIHNl
cmllcyBmb3IgTGludXgtNi4xOAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
