Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC4EE4990
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 18:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9aaDjE+I0wO/0Li2kFKj9rQUTau3FP+LRV2FVopOJw=; b=Ao4EeK84GfgslV
	DbSoG28Cgdz/Zbil3xW74OcvdPrVf39pkCKNPlb86fIxEPU6LKg1M90nlrze6sCrjQSySxHBrokaj
	vwEZQ+ldRDQHNVrXVJUid7N7boS8uaqhdZAoJXLZO2wGp54xuL185lwgB795m2cT4bEXlILTn322D
	d0ji9rc5pXNrsF5UeX+OQ2By5nrQycZJF1+hUIvaJoQRz7mxo9nEXnk/nkg5StN5nb5AY4VF4NZ9e
	JeqK46dBUCcEFaoqXK8cNlcSV9F5rBjqZH35koPo/CG4PC8oVB1XKSUTcVu4gXr1uqpIpXpfeiei6
	plqltzL/icOxvmrxzmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae7L-00000005AGd-3AUw;
	Tue, 30 Dec 2025 18:06:47 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae7J-00000005AFE-3O11
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 18:06:46 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-88a379ca088so117163966d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 10:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767118005; x=1767722805; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kw6K1zDOG7+9A9tzeUA0t/hpBL/fZjOT2o6xij6Wc/E=;
        b=SOHsQ1NhkvXnDza0FZ3VckMT7BCIRQ5WMjKbDO3HIlAgc24ZokARejYUrqT9y117yV
         8p+yju7Hn/+c0cKogp6JH8IAuOHcUDuDFL8OYIy0eJVUkVrWJ4CbkINtCmw7oEDbvO5W
         n9SkkWK3XQ7cpSwdcMuAiYVtNebg1VR83dSIs5YXFQOPF8bvzMQe5bq2t0A6t2iF+len
         OoNAQ/pELwerBuHwxSl5fhJlhkDKpjCgMXmGHFraLlR8Ux3uDQyAA7JvjVDH1pXcgnQU
         IZ5Lh53qmvpyraxwGwV0xEeAQ7/sOpYWWqh6rVPVfcNDTAoVimC1+99cPnMJJbGJ6FXK
         ofDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118005; x=1767722805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kw6K1zDOG7+9A9tzeUA0t/hpBL/fZjOT2o6xij6Wc/E=;
        b=TrvV7f3SV/7/DMT2My1OMuaxpItgkKZ3b4nTJK6P1/4Lf5YaxAR7VwPXDP7egjvkJ8
         zhBbMlH4s1oqtP7PC38xFIstzNtLZJ9WrgkfEJ97Iz+8w+VfGqis2/qqpbVn1nUT6qC5
         h5v+1vzmrFf2BjcmzbeQ9cltzdOD/wsOo+xlm0kdLdOgaX/+GB508oQQP/s8stRSQzBo
         OAJi8VctPI90Izyik1DP4Bi3u33Bjl2Bw6vKIeE3qdNDq4WfUYW2h+2hjwU5u5/Rm+FV
         VNcwetOHOo0bcT1TtORbBT2Mh9WMauoSiQ8/0fQ/wf6pu5t4UN9m+zgjzQinyIyTy9mD
         6sTg==
X-Forwarded-Encrypted: i=1; AJvYcCXU44VQzs/ZKET3NCsMHCFVWhaRBjuF9nb81ua/x7wAE+WFPOIx9v6FKPIrXv9xYlwlDlzgxgGz8a6iBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL3mGkUMM1AcEFP8S7lrJcng88F/U90K/OPwyMcaBcIaIL1RU8
	Ig5Rg6cR/wl3c3QcznnVvFUFQwYAHycmBpKNEkX7W/xl+XxB1838C9wUOzbG8RX4tO8=
X-Gm-Gg: AY/fxX6fd8/UlAhiCmHxwF0xXyyUsQxxmo2Ux3TdqG4qakw06pxhZ38tL4BaHnrV0pK
	51zHP7OZgoQesOr176uNy4vQdob3r4obmhVObHpUTPqrA1D6xok70RvJlr7+XI/5He6T/vidgTU
	SSTpc2ejniNSy6VVlWrUAMabT07eaoYTrNzkK+e1tlCp7NojDVyhZ4/+ZdbPV51BRdWPhofetMR
	ACfL9qFIQpGsiZiu2ZuO8t8yD/si5DJ+K1uOaxbX5z5frh0/rIjPIHg+VNrs3MTATo5SiSMq2tU
	xmZUa5Hi4ZwCrywXE5tLDICaLVXC/mKUvRHG/hx7peHWAf1v4mqEASZv+TFQ5YZou8WzCbn6H9p
	flwFBxiKPBLuG74odESBNbeM5NrhkF8k2Eb8vElIZ2Q2pLhM5EogIFPGK7muoWsRnU6KUywI/1M
	H+paOHaAkUgk9ESdbrEtKbaE0OQWXC9i5mbLt6KkX/tejtjnPySsI=
X-Google-Smtp-Source: AGHT+IH9R9RdQs+4+/paw7zFCFKKDDzjpBdbtJmraB11OzlyUV7KUFzWKn/pZTATXFnVWVQr0NrhUQ==
X-Received: by 2002:a05:6214:4308:b0:88a:2f0f:c173 with SMTP id 6a1803df08f44-88d86e482c0mr506484426d6.68.1767118004593;
        Tue, 30 Dec 2025 10:06:44 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7e8d4sm261620256d6.41.2025.12.30.10.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:06:44 -0800 (PST)
Message-ID: <55c2c0e2-2213-4cc9-a752-fce17149bc35@riscstar.com>
Date: Tue, 30 Dec 2025 12:06:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
 <20251230-imprison-sleet-6b5a1e26d34b@spud>
 <dc87a3c0-8627-4328-a17a-6510ee8245ac@riscstar.com>
 <20251230-ungloved-unworthy-cacc7e22e1c7@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230-ungloved-unworthy-cacc7e22e1c7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_100645_858886_2FA4AAE9 
X-CRM114-Status: GOOD (  17.40  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMzAvMjUgMTE6NDYgQU0sIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBUdWUsIERlYyAz
MCwgMjAyNSBhdCAxMToyOToxNEFNIC0wNjAwLCBBbGV4IEVsZGVyIHdyb3RlOgo+PiBPbiAxMi8z
MC8yNSAxMTowOSBBTSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4gT24gRnJpLCBEZWMgMjYsIDIw
MjUgYXQgMDM6Mjg6MjVQTSAtMDYwMCwgQWxleCBFbGRlciB3cm90ZToKPj4+PiBPbiAxMi8yMy8y
NSAxMjo1MSBBTSwgR3VvZG9uZyBYdSB3cm90ZToKPj4+Pj4gSGksIENvbm9yCj4+Pj4+Cj4+Pj4+
IE9uIFR1ZSwgRGVjIDIzLCAyMDI1IGF0IDU6MTfigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+IE9uIE1vbiwgRGVjIDIyLCAyMDI1IGF0IDA5
OjA0OjE3UE0gKzA4MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4+Pj4+Pj4gQWRkIGRlc2NyaXB0aW9u
IG9mIHRoZSBzaW5nbGUtbGV0dGVyICJCIiBleHRlbm5zaW9uIGZvciBCaXQgTWFuaXB1bGF0aW9u
Lgo+Pj4+Pj4+IEIgaXMgbWFuZGF0b3J5IGZvciBSVkEyM1U2NC4KPj4+Pj4+Pgo+Pj4+Pj4+IFRo
ZSBCIGV4dGVuc2lvbiBpcyByYXRpZmllZCBpbiB0aGUgMjAyNDA0MTEgdmVyc2lvbiBvZiB0aGUg
dW5wcml2aWxlZ2VkCj4+Pj4+Pj4gSVNBIHNwZWNpZmljYXRpb24uIEFjY29yZGluZyB0byB0aGUg
cmF0aWZpZWQgc3BlYywgInRoZSBCIHN0YW5kYXJkCj4+Pj4+Pj4gZXh0ZW5zaW9uIGNvbXByaXNl
cyBpbnN0cnVjdGlvbnMgcHJvdmlkZWQgYnkgdGhlIFpiYSwgWmJiLCBhbmQgWmJzCj4+Pj4+Pj4g
ZXh0ZW5zaW9ucy4KPj4+Pj4+Pgo+Pj4+Pj4+IEhlbmNlIGFkZCBhIHNjaGVtYSBjaGVjayBydWxl
IHRvIGVuZm9yY2UgdGhhdCBCIGltcGxpZXMgWmJhLCBaYmIgYW5kIFpicy4KPj4+Pj4+Pgo+Pj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+Pj4+
Pj4+IC0tLQoKLiAuIC4KCj4+PiBUaGUgZGVwZW5kZW5jeSBjYW4gYmUgZ28gYm90aCB3YXlzLCB0
byBhbHNvIG1ha2Ugc3BlY2lmeWluZyAiYiIgbWFuZGF0b3J5Cj4+PiB3aGVuIHRoZSB0aHJlZSBj
b21wb25lbnRzIGFyZS4gVGhhdCBwcm9iYWJseSBwcm9kdWNlcyB0aGUgbW9zdCBoZWxwZnVsCj4+
PiBkZXZpY2V0cmVlIHVsdGltYXRlbHkuCj4+Cj4+IFdoYXQgYWJvdXQgRFQgZmlsZXMgdGhhdCBz
cGVjaWZpZWQgemJhK3piYit6YnMgYmVmb3JlICJiIiB3YXMKPj4gcmF0aWZpZWQ/Cj4gCj4gVGhl
eSdkIGdlbmVyYXRlIGEgd2FybmluZywgd2hpY2ggY2FuIHRoZW4gYmUgZml4ZWQuIFRoYXQncyBm
aW5lIHRvIGRvLCBhCj4gd2FybmluZyBpbiBsaW51eC1uZXh0IGRvZXNuJ3QgaGFybSBhbnlvbmUu
IFVwZGF0aW5nIGRldmljZXRyZWVzIGluIHdheXMKPiB0aGF0IGRvbid0IGNoYW5nZSB0aGVpciBt
ZWFuaW5nIGJ1dCBwcm92aWRlIGV4dHJhIHZhbHVlIGlzIG5vdCBhIHByb2JsZW0KPiBpbiBteSBi
b29rLgoKT0suCgouIC4gLgoKPj4gQnV0IHdoeSBldmVuIGJvdGhlciBzdXBwb3J0aW5nICJiIiBp
ZiB5b3UgaGF2ZSB0byAqYWxzbyoKPj4gc3VwcG9ydCAiemJhK3piYit6YnMiIGlmIHlvdSB1c2Ug
aXQ/ICBJdCBhZGRzIHRoZSBwb3NzaWJpbGl0eQo+PiBvZiBuZXcgZXJyb3JzICgiYiIgd2l0aG91
dCAiemJzIiwgZm9yIGV4YW1wbGUpLCB3aGlsZSBub3QKPj4gcmVhbGx5IGVuYWJsaW5nIG9yIHJl
cHJlc2VudGluZyBhbnl0aGluZyBuZXcuCj4gCj4gVGhhdCB3YXMgbXkgZmlyc3QgcXVlc3Rpb24g
YWZ0ZXIgYWxsISBVbHRpbWF0ZWx5IEknZCByZWFsbHkgZXJyIG9uIHRoZQo+IHNpZGUgb2YgYWRk
aW5nIGl0IGJlY2F1c2UgcGVvcGxlIHdpbGwgZXhwZWN0IHRvIGJlIGFibGUgdG8gdXNlIGl0IGFu
ZAo+IGJlY2F1c2UsIGluIHRlcm1zIG9mIGtlcm5lbCBzdXBwb3J0LCBpdCB3aWxsIGJlIHVzZWZ1
bCBmb3IgQUNQSSBzeXN0ZW1zLgoKSSB0aGluayBpdCdzIHRvbyBiYWQgdGhlc2UgImVxdWl2YWxl
bnQiIGV4dGVuc2lvbnMgY2FuJ3QgYmUgdXNlZAp0byBzaW1wbGlmeSB0aGluZ3MuCgpJIHJlYWxs
eSBkaXNsaWtlIHJlcXVpcmluZyB0aGUgYm90aCBhIHNpbXBsZXIgZXh0ZW5zaW9uICphbmQqCnRo
ZSBvdGhlcnMgdGhhdCBpdCByZXByZXNlbnRzL2ltcGxpZXMuCgpCdXQgcHJhY3RpY2FsbHkgc3Bl
YWtpbmcgeW91J3JlIHByb2JhYmx5IHJpZ2h0LiAgUGVvcGxlIHdpbGwKZXhwZWN0IHRvIGJlIGFi
bGUgdG8gdXNlIHRoZW0uICBEVCB0b29scyB3aWxsIHRoZW4gcG9pbnQgb3V0CndoYXQncyBtaXNz
aW5nLCBhbmQgdGhlIGxpc3Qgb2YgZXh0ZW5zaW9ucyBzdXBwb3J0ZWQgYnkgYQpnaXZlbiBDUFUg
d2lsbCBqdXN0IGdyb3cgYW5kIGdyb3cgYW5kIGdyb3cuCgoJCQkJCS1BbGV4CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
