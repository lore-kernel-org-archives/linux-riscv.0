Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3281AC47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 14:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xRfp0Kd7Z05HB5vcqqnkvIHTCEXLHvQDRPtP9BX4AM=; b=ZbGjDzTznxuZ2q
	e6gb2MA2VLDb2OvLIATVIw3QrMtJ+eKXxTxumAZysAoghzWaHzoS205t1CgVsWU4zWZkWQwGsfRj3
	lDdi4jRbguMjqMNn7fmYNjOd6BIen/89WPxZzAnVZ2hh7nTANBfDeP5sTfPwYRoYgPY/hqWn6FEDp
	f5lOsesXuKeweewEWOU5BQnbAHZZ8dDDfYDo1j+etMvVFzbfCoDfKsm9/FxAYlhen7Dj+t6+Oefxo
	C86+PA0Y8ww+QPeod1b2cNuTslClNZVGan2Mpdpwk4wOV+QgCz3Fyyi0OmmnAqMgjod+cIN/dQPQg
	6f2s0a+I2Yggkz7Ed3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPkea-00CJUB-0u;
	Tue, 16 Jan 2024 14:43:00 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPkeX-00CJTl-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 14:42:59 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bd562d17dcso3470246b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 06:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705416116; x=1706020916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ4d+SlUG6im65swBc/lE81/JJeu4tSZ2OjB3i8zM48=;
        b=ciE7K0zNWi5hzjPeP1XdrP5nhM9Bx5WWjSXuGw/IcYNAkI34G5oUXpDHQRtz1NwVrG
         0NY8kjvjYzgbhozLG+yEgi7WgDAL/yVUF64YZXAUR71cYcORQVtdBEWAX56e07Hl60HT
         ZXwZmBOWih6+Vfy0z3GTodOzMKmAxVfB4CQgeFcg11ia7UfTiS7pzy188CRgq3DHKPIr
         YdjwS3/lQxvBH88Vv7AOZtH75R+WZ1ZbNG4YBfKrzxinQu4WF5U+0AIRAO0tw/L+dV0s
         2ECQWB2w8BOeASZCQ0GQpbtjWYAzdp06C/K2SjC6OY3ZQ6SQ+kv6wBzKBHyVMiRpEJ1E
         vtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705416116; x=1706020916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ4d+SlUG6im65swBc/lE81/JJeu4tSZ2OjB3i8zM48=;
        b=fZtg76hzfB0hRL/4wHGeY5ZyneCJkeetUtyjt3qpxgrX8dzHwY2cSUgvoAizQqfLHc
         TXECCPdwOTF7auwRUmfb/TX/QtGJHrWKSOhrktF1LfizE3RCdqYBgvI+JLTtTgi5qWQX
         QCSFDpwmdtFj/zvmG4wzzcusaJ35lmPaSNX+1P5V19RymwqBCNIUFJhOwbN1YiO2yykn
         4dXia3mUyv8PMN7NyU9+rX3UFQCKVyNnjbz8kpFiRem+3ClDJngeD6cxq2NTZ91v92MS
         WtUc6hkwiTPMWgYuFSYtvNSpp67uoPLPGmsWu7101R/JIJBefAkUeeVNEJ1kCsGqsxW1
         tifw==
X-Gm-Message-State: AOJu0YzMy/4mQmwx/QzU955q7Mz544Kh92Rgtk660JzetuVwhu54KV4R
	Ledm4MUAwZeuSqfycn9sP7LtCMMEi/IZVCWJNl8=
X-Google-Smtp-Source: AGHT+IGdN42iTr1pjIYzZRVPqpOkdba/69EuP+xiL6yzLztkZqhXPgykIy6zP7S0/jTHm/ia2tFzbofM6OSceHK7xBE=
X-Received: by 2002:a05:6870:1687:b0:203:8474:e84b with SMTP id
 j7-20020a056870168700b002038474e84bmr10287293oae.24.1705416115534; Tue, 16
 Jan 2024 06:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com> <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
In-Reply-To: <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 16 Jan 2024 22:41:44 +0800
Message-ID: <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_064257_833497_856ACA26 
X-CRM114-Status: GOOD (  27.10  )
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

T24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgMzo0NOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNS8wMS8yMDI0IDE3
OjA2LCBKaW5nYmFvIFFpdSB3cm90ZToKPiA+IEFkZCB0aGUgcnRjIGRldmljZSB0cmVlIG5vZGUg
dG8gY3YxODAwIFNvQy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaW5nYmFvIFFpdSA8cWl1amlu
Z2Jhby5kbG11QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL2N2MTgwMGIuZHRzaSB8IDEyICsrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL2N2MTgwMGIuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIu
ZHRzaQo+ID4gaW5kZXggZGY0MGU4N2VlMDYzLi42NmJiNGE3NTJiOTEgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQo+ID4gQEAgLTExOSw1ICsxMTksMTcg
QEAgY2xpbnQ6IHRpbWVyQDc0MDAwMDAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHg3NDAwMDAwMCAweDEwMDAwPjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMgMz4sIDwmY3B1MF9pbnRjIDc+Owo+ID4gICAgICAg
ICAgICAgICB9Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICBydGM6IHJ0Y0A1MDI1MDAwIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDAtcnRjIiwg
InN5c2NvbiI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NTAyNTAwMCAweDIw
MDA+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVf
TEVWRUxfSElHSD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZvc2M+Owo+
ID4gKyAgICAgICAgICAgICB9Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICBwb3Igewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMC1wb3IiOwo+Cj4g
V2hhdCBpcyB0aGlzPyBXaHkgaXMgaXQgaGVyZSwgaG93IGRpZCBpdCBldmVuIGFwcGVhcj8gSXQg
bWlzc2VzIHVuaXQKPiBhZGRyZXNzIGFuZCByZWcgb3IgaXMgY2xlYXJseSBwbGFjZWQgaW4gd3Jv
bmcgcGxhY2UuIEl0IHNlZW1zIHlvdQo+IGVudGlyZWx5IGlnbm9yZWQgb3V0IHByZXZpb3VzIGRp
c2N1c3Npb24uCj4KPiBOQUsKPgoKSSdtIHZlcnkgc29ycnkgZm9yIHdhc3RpbmcgeW91ciB0aW1l
LiBGdXJ0aGVybW9yZSwgd2Ugd291bGQgbGlrZSB0bwp0aGFuayB5b3UgZm9yIHlvdXIgcGF0aWVu
dCByZXNwb25zZS4KTGV0IG1lIHJlYWxpemUgdGhlIHJpZ29yIG9mIExpbnV4IGtlcm5lbCBjb2Rl
LiBJIGdyZWF0bHkgYWRtaXJlCnRoaXMuUGxlYXNlIGFsbG93IG1lIHRvIGJyaWVmbHkgcmV2aWV3
Cm91ciBwcmV2aW91cyBkaXNjdXNzaW9ucy4KCkNWMTgwMCBpcyBhIFJJU0NWIGJhc2VkIFNPQyB0
aGF0IGluY2x1ZGVzIGFuIFJUQyBtb2R1bGUuIFRoZSBSVEMKbW9kdWxlIGhhcyBhbiBPU0Mgb3Nj
aWxsYXRvcgphbmQgUE9SIHN1Ym1vZHVsZSBpbnNpZGUuVGhpcyBPU0Mgb3NjaWxsYXRvciBpcyBv
bmx5IGZvciBSVEMgdXNlLCBzbwppdCBkb2VzIG5vdCBuZWVkIHRvIGJlIGRlc2NyaWJlZAphcyBh
IGR0IG5vZGUuIFRoZSBQT1Igc3VibW9kdWxlIHByb3ZpZGVzIHBvd2VyIG9mZi9vbiBhbmQgcmVz
dGFydApmdW5jdGlvbnMgZm9yIENWMTgwMC4gU28gSSBuZWVkCnR3byBkcml2ZXJzIGNvcnJlc3Bv
bmRpbmcgdG8gUlRDIGFuZCBQT1IgcmVzcGVjdGl2ZWx5LiBSVEMgcmVxdWlyZXMKdGhlIHVzZSBv
ZiBpcnEgYW5kIGNsayByZXNvdXJjZXMKaW4gYWRkaXRpb24gdG8gcmVnaXN0ZXJzLCB3aGlsZSBQ
T1Igb25seSByZXF1aXJlcyBSZWcgcmVzb3VyY2VzLiBUaGUKY3VycmVudCBwcm9ibGVtIGlzIGhv
dyB0byBkZXNjcmliZQp0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4gUlRDIGFuZCBQT1IsIGFuZCBo
b3cgdG8gbWFrZSByZWdpc3RlcnMgc2hhcmVkCmJ5IHRoZXNlIHR3byBkcml2ZXJzLgoKSW4gdjMs
IEkgdGhvdWdodCBSVEMgd2FzIGFuIE1GRCBkZXZpY2UgYmVjYXVzZSBpdCBub3Qgb25seSBoYWQg
UlRDCmZ1bmN0aW9uYWxpdHkgYnV0IGFsc28gcmVzdGFydCBhbmQKcG93ZXIgb24vb2ZmIGNhcGFi
aWxpdGllcy5TbyBteSBleGFtcGxlIGlzIHNob3duIGJlbG93LgoKc3lzY29uQDUwMjUwMDAgewog
IGNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMGItc3Vic3lzIiwgInN5c2NvbiIsICJzaW1wbGUt
bWZkIjsKICByZWcgPSA8MHgwNTAyNTAwMCAweDIwMDA+OwogIHJ0YyB7CiAgICBjb21wYXRpYmxl
ID0gInNvcGhnbyxjdjE4MDBiLXJ0YyI7CiAgICBpbnRlcnJ1cHRzID0gPDE3IElSUV9UWVBFX0xF
VkVMX0hJR0g+OwogICAgY2xvY2tzID0gPCZjbGsgQ0xLX1JUQ18yNU0+OwogIH07Cn0KClRoZXJl
IHdlcmUgdHdvIHN1Z2dlc3Rpb25zIHlvdSBtYWRlIGF0IHRoZSB0aW1lLiBGaXJzdGx5LCBJIG9u
bHkKZGVzY3JpYmVkIFJUQyBhbmQgZGlkIG5vdCBkZXNjcmliZQp0aGUgUE9SIHN1Ym1vZHVsZS4g
U2Vjb25kbHksIHJlZ2FyZGluZyB0aGUgbmFtZSBpc3N1ZSwgc3lzdGVtCmNvbnRyb2xsZXJzIHNo
b3VsZCBub3QgYmUgcGxhY2VkCmluIHRoZSBtZmQgZmlsZS5BZnRlcndhcmRzLCBJIHJlbGVhc2Vk
IHRoZSA0dGggdmVyc2lvbiwgaW4gd2hpY2ggSQpkZXNjcmliZWQgdGhlIFBPUiBzdWJtb2R1bGUs
IHdoaWNoCmlzIGluY2x1ZGVkIHNpZGUgYnkgc2lkZSB3aXRoIFJUQyBpbiB0aGUgbWlzYyBkZXZp
Y2UuIFRoZW4sIGJ5IHNoYXJpbmcKdGhlIHJlZ2lzdGVyLCBib3RoIFJUQyBhbmQKUE9SIGRyaXZl
cnMgY2FuIGFjY2VzcyB0aGUgcmVnaXN0ZXJzLgoKbWlzY0A1MDI1MDAwIHsKICBjb21wYXRpYmxl
ID0gInNvcGhnbyxjdjE4MDAtbWlzYyIsICJzeXNjb24iLCAic2ltcGxlLW1mZCI7CiAgcmVnID0g
PDB4MDUwMjUwMDAgMHgyMDAwPjsKICBydGMgIHsKICAgIGNvbXBhdGlibGUgPSAic29waGdvLGN2
MTgwMC1ydGMiOwogICAgaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKICAg
IGNsb2NrcyA9IDwmY2xrIDE1PjsKICB9OwogIHBvciAgewogICAgY29tcGF0aWJsZSA9ICJzb3Bo
Z28sY3YxODAwLXBvciI7CiAgfTsKfTsKCllvdXIgc3VnZ2VzdGlvbiBpcywgZmlyc3RseSwgdGhl
IHBvciBzdWJtb2R1bGUgZG9lcyBub3QgaGF2ZSBhbnkKcmVzb3VyY2VzLCBzbyBpdCBzaG91bGQg
YmUgZGVsZXRlZC4KVGhlIHNlY29uZCBpc3N1ZSBpcyBzdGlsbCB0aGUgbmFtZSwgbWlzYyBpcyBh
bnkgZGV2aWNlLgpBZnRlcndhcmRzLCBJIHJlbGVhc2VkIHRoZSA1dGggZWRpdGlvbi4gSW4gdGhp
cyB2ZXJzaW9uLCBJIHJlbW92ZWQgdGhlClBPUiBzdWJtb2R1bGUgaW4gUlRDLgoKcnRjQDUwMjUw
MDAgewogICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwLXJ0YyIsICJzeXNjb24iOwogICAg
cmVnID0gPDB4NTAyNTAwMCAweDIwMDA+OwogICAgaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKICAgIGNsb2NrcyA9IDwmY2xrIDE1PjsKfTsKClRoZSBxdWVzdGlvbiB5b3Ug
cmFpc2VkIGlzIHdoeSBzeXNjb24gY2hpbGQgbm9kZXMgYXJlIHVzZWQuCkluIHRoaXMgdmVyc2lv
biwgSSB3aWxsIHRyeSB0aGUgZm9sbG93aW5nIG1ldGhvZHMuCgpydGM6IHJ0Y0A1MDI1MDAwIHsK
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDAtcnRjIiwgInN5
c2NvbiI7CiAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NTAyNTAwMCAweDIwMDA+OwogICAg
ICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MTcgSVJRX1RZUEVfTEVWRUxfSElHSD47CiAg
ICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZvc2M+Owp9Owpwb3IgewogICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMC1wb3IiOwogICAgICAgICAgICAgICAg
ICAgIHNvcGhnbyxydGMtc3lzcmVnID0gPCZydGM+Owp9OwoKTXkgaWRlYSBpcyB0aGF0IHRoaXMg
cmVnaXN0ZXIgY2FuIGJlIGFjY2Vzc2VkIHRocm91Z2ggdGhlIHN5c2NvbiB0YWcsClJUQyBkcml2
ZXIsIGFuZCByZWJvb3QgZHJpdmVyLgpUaGVuIGNvbXBsZXRlIHRoZWlyIGZ1bmN0aW9ucy4KSSdt
IHNvcnJ5IGlmIGl0IHdhcyBkdWUgdG8gbGFuZ3VhZ2UgZGlmZmVyZW5jZXMgdGhhdCBjYXVzZWQg
bXkgbWlzdW5kZXJzdGFuZGluZy4KUGVyaGFwcyBJIGNhbiBhY2NvbXBsaXNoIGl0IHRocm91Z2gg
dGhlIGZvbGxvd2luZyBtZXRob2RzLgpydGM6IHJ0Y0A1MDI1MDAwIHsKICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInNvcGhnbyxjdjE4MDAtcnRjIiwgInNvcGhnbyxjdjE4MDAtcG9y
IjsKICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHg1MDI1MDAwIDB4MjAwMD47CiAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxNyBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKICAgICAg
ICAgICAgICAgICAgICBjbG9ja3MgPSA8Jm9zYz47Cn07Ckhvd2V2ZXIsIGluIHJlYWxpdHksIHRo
ZSBQT1Igc3VibW9kdWxlIGRvZXMgbm90IHVzZSBJUlEgYW5kIENMSy4KUGxlYXNlIGRvIG5vdCBo
ZXNpdGF0ZSB0byB0ZWFjaC4gVGhhbmtzLgoKCkJlc3QgcmVnYXJkcywKSmluZ2JhbyBRaXUKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
