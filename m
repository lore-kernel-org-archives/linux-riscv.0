Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E52C624D8
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Feb 2026 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQtbw1na+HYBfJ9vQWxCtEYAk1LA7yjrKhggC4T8jR8=; b=FtL/s47s52y+lb
	F1kigx7HEQs3oxWSMkxECeFVkzoZRRqFZ47Ob0yCyxb88q/Ui5HH+bF3UidGP0+aAUGSfA+f9U/3L
	dbsWQ985Tv+W6+LWmls83xOxYLg4Yw81yIkDrxpeQoxDR657MHaaIv2Ybtd7MmPNHg4mhsT9alL30
	pQzVjgNHSP0WCMpg9ye+/2F6EtcwVyk5Nnz9WL9eFb0JiCjnxKh8T9SH6nwHAT3BpsVyAXGzUi/0m
	M4XDdGPaJMaM1vg50F2t0O4BQFugTRnILCWwMzYdBY9H6h4liMbX4pGNxjr+4ftTcm9TVN5I9Doja
	6N17xiPLY4R1bzXgBEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu8bg-0000000GhAS-3ngP;
	Sun, 22 Feb 2026 12:30:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vu8bd-0000000Gh9m-43ez
	for linux-riscv@lists.infradead.org;
	Sun, 22 Feb 2026 12:30:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso39283675e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Feb 2026 04:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771763435; x=1772368235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSJS2GkYexnr2R3qwinnT+ROgZLneAGoFNuJa+6p93s=;
        b=kZiREeJvKt9QJUAosEAtF80fBget1+sHvv4Jlf2RkT7JYcWbNyzKnakyN7gA3oobuV
         GRXnvUHeSNVOseCt2vBAnAHFmX3ebFNYfSzBwZTLdeFeXVEr0qo5ot3FZ1UBj5LkJKMi
         75JGJIfpc4fyyCk7pVfhlFTgCV+z//p8SfyKwmFix+57w0cl6Xuq/5DYeb74CRPjcsPi
         Vv82hJpMiiGz7r5D6EnIL/Es0Ot59VMl8euoifppIP/lEWBfCQtgbrxPECKMSAbMgfFY
         H81wqOdK3dAQhp0SLpaOR+RjzmTp29NsjdXPj6r/7tQ/UZzFkS5+OjZBYQQGcWE1Ovx5
         AZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771763435; x=1772368235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oSJS2GkYexnr2R3qwinnT+ROgZLneAGoFNuJa+6p93s=;
        b=ptDT7ef9uKyxrrhExuFmx10Q+1/5uEJc8qpV57C23SMXVsVxVkOOz4G0wwb4BXyBQD
         XkiEtXCdE9uid7OlF0ARVmPaMry2eKuA1PoCXKSZutwsihwO+c5SM8sks6t+df0p+YA8
         KNkFp24+AU6SxKn8Luov7MuvNNGoDJWIWq9HEB5PScf4hWCQ9VvYgFBUqO3hRJeYnM0L
         ZvwjTIp/nzkOwRq5xQL2Y4xsXe4e486q+AafMCfayWDNny4uoWv7pr7xNPIKd4XEfta0
         94gWxkDJuF4argcu8dm7otNJ5cyaYL5t7kH0RlO8wNAxcPNrnSnciHAPNBv3God9qYwA
         Oomw==
X-Forwarded-Encrypted: i=1; AJvYcCWM+SK8tblpdW/bIDq/w2FP97qIzmxdUawRUQkDa0HRHgxzCJuMWl/v1fhPm2zzKh93hXPzm2T5lg6VoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5n9i83VC4Sqwx2UlqPlzLk8OSbz1KZ2VXmpOdzzOX27QSP/SB
	PgWOx6pOvJO3LRoal86Nrv2BSHPzrsY6K9OcEAbsIyALo0n8NH4gSTJ9
X-Gm-Gg: AZuq6aKb6Ws7+ZKcjYmX5adIpk98j03TniLeLw5+kNyvkUq2keaOiPhU4Akg56OR9GY
	JE/BONjs8uoMIZhyIjt2t2WRT68gax6adNBxgyrvvyn6hKJsEu9NXqHuzsFUJn8gEyXiQyZPSfa
	VkQCFCw2uSOwKJKTkoso9KhwkysoAbQoK/P/lyPCy1dt8p1XpkDinIWZfhtWByV9tyuWDrCV4Rc
	4qrRbbm2aoCmZ13ldrcg3ICXF6RgMIL+8cUpQRGTZMi2Gp9xmJ1yXe4D4gFuuK/sLGTnIKf+VRj
	L7AZz1hfpSoTJNpOOYXSbtl/tQliybpMuSbi8k9H5P2CM50zUMqBfQvuwT4HEttLTG/KfRhvYIl
	srJyazdOarTgRaU+FO/0ycte3F2go2eohK5u+cyY8AQ4157gUVaE1kyF2iaobRzgJL5XKSut3Uf
	4yEbNGFASir1D0t2qhZUpTatXYEmlRw3GGLFDTO377/Te+t5uy1qoMgWc0fHIi6/NgGTeHt02b4
	KOQ9X3aQT2qEWosdQ==
X-Received: by 2002:a05:600c:8183:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-483a962e09fmr77433955e9.21.1771763435348;
        Sun, 22 Feb 2026 04:30:35 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dd3391sm124921405e9.1.2026.02.22.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 04:30:34 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aleksandr Shubin <privatesub2@gmail.com>
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lukas Schmid <lukas.schmid@netcube.li>, Cheo Fusi <fusibrandon13@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Sun, 22 Feb 2026 13:30:32 +0100
Message-ID: <2265500.irdbgypaU6@jernej-laptop>
In-Reply-To: <20260221183609.95403-4-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
 <20260221183609.95403-4-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_043038_056374_81ECBD37 
X-CRM114-Status: GOOD (  12.81  )
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

RG5lIHNvYm90YSwgMjEuIGZlYnJ1YXIgMjAyNiBvYiAxOTozNTo1MyBTcmVkbmplZXZyb3Bza2kg
c3RhbmRhcmRuaSDEjWFzIGplIEFsZWtzYW5kciBTaHViaW4gbmFwaXNhbChhKToKPiBEMSBhbmQg
VDExM3MgY29udGFpbiBhIHB3bSBjb250cm9sbGVyIHdpdGggOCBjaGFubmVscy4KPiBUaGlzIGNv
bnRyb2xsZXIgaXMgc3VwcG9ydGVkIGJ5IHRoZSBzdW44aS1wd20gZHJpdmVyLgo+IAo+IEFkZCBh
IGRldmljZSB0cmVlIG5vZGUgZm9yIGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZWtzYW5kciBT
aHViaW4gPHByaXZhdGVzdWIyQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9ib290L2R0
cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSB8IDEzICsrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiBpbmRleCA2M2UyNTJiNDQ5NzMu
LjhlMzhhMGQ5NWY1YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW54aS1kMXMtdDExMy5kdHNpCj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5u
ZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+IEBAIC0xOTMsNiArMTkzLDE5IEBAIHVhcnQzX3BiX3Bp
bnM6IHVhcnQzLXBiLXBpbnMgewo+ICAJCQl9Owo+ICAJCX07Cj4gIAo+ICsJCXB3bTogcHdtQDIw
MDBjMDAgewo+ICsJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW4yMGktZDEtcHdtIjsKPiAr
CQkJcmVnID0gPDB4MDIwMDBjMDAgMHg0MDA+Owo+ICsJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVT
X1BXTT4sCj4gKwkJCQkgPCZkY3hvPiwKPiArCQkJCSA8JmNjdSBDTEtfQVBCMD47Cj4gKwkJCWNs
b2NrLW5hbWVzID0gImJ1cyIsICJob3NjIiwgImFwYiI7Cj4gKwkJCXJlc2V0cyA9IDwmY2N1IFJT
VF9CVVNfUFdNPjsKPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsKCk1vdmUgc3RhdHVzIGF0IHRo
ZSBib3R0b20uCgo+ICsJCQkjcHdtLWNlbGxzID0gPDB4Mz47CgpKdXN0IHVzZSBkZWNpbWFsIGZv
cm1hdC4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+ICsJCQlhbGx3aW5uZXIsbnB3bXMgPSA8OD47
Cj4gKwkJfTsKPiArCj4gIAkJY2N1OiBjbG9jay1jb250cm9sbGVyQDIwMDEwMDAgewo+ICAJCQlj
b21wYXRpYmxlID0gImFsbHdpbm5lcixzdW4yMGktZDEtY2N1IjsKPiAgCQkJcmVnID0gPDB4MjAw
MTAwMCAweDEwMDA+Owo+IAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
