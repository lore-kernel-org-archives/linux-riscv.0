Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7DDC54E68
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 02:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drdigpbDyGaCXrLkJOzFbBdvMCwmti6KaJPEOi4OT0A=; b=EBl3pN/M1LEymH
	bNqrpWYJ9L66xwdIddSQ2fDwlxMd7hXbC6qi5FvvrROEcUoca/eFJ8//YDRwJvbiISUY1viwrJokD
	zOpuq0lrHXZeSY7tXaupvRGTKjG/VY+Fr68q3G9bgaE3lUF2w20aK8wZjW+xrXvHBX8SEE0x71blT
	/xTfmHzfkTaRGOsLKDIgtmnA2F17MVDX4Svaz2GNSM7/h0mArYfBfw8nYIOFTHm1ebZ5Z+XVSQXyl
	eDEjkLdOhkvRWhWo6xcMccHBlfhoF30iHpifOuZxhRtkannbsvXZVzvySDj23EJc2W7sM1+XWQq4R
	R+7nChnngLS7Ij6Pdh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlZD-0000000F2xn-085V;
	Wed, 20 Mar 2024 02:20:35 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmlZ9-0000000F2tJ-1Sz9
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 02:20:33 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-221ffba5c8bso4525859fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 19:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710901223; x=1711506023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOyJHHqFC/8u3+w4ikgJUO8ZFv830cLwlnuWmCFNnBM=;
        b=GdqgvH5Y5/0fTBEMMW7Hx1SW2pzyXMDkJ2uVWNkG4+xVRuNMuka6/zRsHh34H7Fwpk
         VtogcADWvHq7L6WEy4vvCvccn+XtZi9NqIlqBM2eqGnE9eSaah8nlUJ3MtbNVtGdWop+
         sSze1leWFe+Lm9dA8nm/ih6vlcw+NdJbyVYuAGwK3UrT2U0P8z3QQTMAk+2oBdViNUHs
         uYgStr6MVxEK8GCcgoKGFxuC9Ny5YnXFX4bedPXqa3K5x57Qyq5yJQOMddLGXmLdFCKZ
         1s4PO/JzygPw2FefNg7PPPRmSoQubl1Eb8rodl6+SiOpxr9p5SgfSPaSEn9XmMKnM3DG
         oJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710901223; x=1711506023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOyJHHqFC/8u3+w4ikgJUO8ZFv830cLwlnuWmCFNnBM=;
        b=D36PrkySV+gPjKuf2d1G/fNB+Kn3zerMSbJ89wtV2au648dKL3k07DgwHXTPQF/cHM
         REph7ud1BK2u9bJFlxp/gm/l83hZZG3Oio3siHxoGy9whNkfd8Q+sQJFWI48/9g+gIdC
         fNUd826ZtmiKcjtcyYZUqUC2a9foEnu+eDjCyZcsj0kirOFuTcXI1STFXVZzFajPj+7e
         vUEONNQRuyzghvcY9hQhWVq9C3F2PDHu8MZKSkzzWx0g29rV/osa5ZD034c3TYDbs0la
         BR5+OpovJ9TcRWQ02Ea/7kv4hQLWiJCrSq3jPKHpZ539yNe9DPBTf6tc6JTwEJ7Kklai
         yFNA==
X-Gm-Message-State: AOJu0YyeprU4yXdZF375qdGc69W8ZnhF2QKmTErXNH4lUBYQovzHTRoY
	JTMxLcZksKjntnxeAJy2oY9olFMAORHdn8wfxu/Q5wVM90hJddXzcWe3nkbSuuCiPuF3yB1PqyU
	0akKsENIbUdDNGMdpzdF9Cz3yPMWtTzB0c1+1F/XDg4J9QxXAJ+xtJw==
X-Google-Smtp-Source: AGHT+IFD3N83WmavB5Hm7jsd91hTsO36CvDfhQosv4S2NtXZYOzNE5wIlFjWRDHY3yAUCsc8x4RZGs2LuqSiWwL1Tcc=
X-Received: by 2002:a05:6870:218a:b0:221:3ba2:fff0 with SMTP id
 l10-20020a056870218a00b002213ba2fff0mr18600721oae.45.1710901223344; Tue, 19
 Mar 2024 19:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <mvmy1aegrhm.fsf@suse.de>
In-Reply-To: <mvmy1aegrhm.fsf@suse.de>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 20 Mar 2024 10:20:12 +0800
Message-ID: <CAEEQ3wkg5kP7q6qnjV5Xmi_-jJnGBSLb2PkN1M88h5rjsif4oQ@mail.gmail.com>
Subject: Re: [External] [PATCH v2] riscv: use KERN_INFO in do_trap
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_192031_570956_4534E190 
X-CRM114-Status: GOOD (  14.29  )
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

SGkgQW5kcmVhcywKCk9uIFR1ZSwgTWFyIDE5LCAyMDI0IGF0IDExOjQw4oCvUE0gQW5kcmVhcyBT
Y2h3YWIgPHNjaHdhYkBzdXNlLmRlPiB3cm90ZToKPgo+IFByaW50IHRoZSBpbnN0cnVjdGlvbiBk
dW1wIHdpdGggaW5mbyBpbnN0ZWFkIG9mIGVtZXJnZW5jeSBsZXZlbC4gIFRoZQo+IHVuaGFuZGxl
ZCBzaWduYWwgbWVzc2FnZSBpcyBvbmx5IGZvciBpbmZvcm1hdGlvbmFsIHB1cnBvc2UuCj4KPiBG
aXhlczogYjhhMDNhNjM0MTI5ICgicmlzY3Y6IGFkZCB1c2VybGFuZCBpbnN0cnVjdGlvbiBkdW1w
IHRvIFJJU0MtViBzcGxhdHMiKQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJlYXMgU2Nod2FiIDxzY2h3
YWJAc3VzZS5kZT4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWlj
cm9jaGlwLmNvbT4KPiAtLS0KPiB2MjogY2xhcmlmeSBjb21taXQgbWVzc2FnZQo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IGluZGV4IGExYjliZTNjNDMz
Mi4uMTQyZjVmNTE2OGZiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gQEAgLTEyMSw3ICsxMjEsNyBAQCB2
b2lkIGRvX3RyYXAoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIGludCBzaWdubywgaW50IGNvZGUsIHVu
c2lnbmVkIGxvbmcgYWRkcikKPiAgICAgICAgICAgICAgICAgcHJpbnRfdm1hX2FkZHIoS0VSTl9D
T05UICIgaW4gIiwgaW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKSk7Cj4gICAgICAgICAgICAgICAg
IHByX2NvbnQoIlxuIik7Cj4gICAgICAgICAgICAgICAgIF9fc2hvd19yZWdzKHJlZ3MpOwo+IC0g
ICAgICAgICAgICAgICBkdW1wX2luc3RyKEtFUk5fRU1FUkcsIHJlZ3MpOwo+ICsgICAgICAgICAg
ICAgICBkdW1wX2luc3RyKEtFUk5fSU5GTywgcmVncyk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAg
IGZvcmNlX3NpZ19mYXVsdChzaWdubywgY29kZSwgKHZvaWQgX191c2VyICopYWRkcik7Cj4gLS0K
PiAyLjQ0LjAKPgo+Cj4gLS0KPiBBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBzY2h3YWJAc3Vz
ZS5kZQo+IEdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNFOSAxOTcwIEY0QkUgIDE3
NDggRTRENCA4OEUzIDBFRUEgQjlENwo+ICJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVs
eSBkaWZmZXJlbnQuIgoKUmV2aWV3ZWQtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPgoKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
