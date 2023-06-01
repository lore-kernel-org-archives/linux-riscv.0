Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF7C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 04:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ew65F4P7TExtfzbr6J9A9036nEe2TGHwLgyEHnvr/vY=; b=bBqUq0UQaf4zyP
	+vgb56bY4vZpfMpEo88s1veIB0/M7FOD/QJuF5A6WyLQygsMFF/mlrLxv18/XLh5u84sERbmmDvZa
	RjuWH3XblsjgJuyEMeTHMjbs3KvUcyfcNUvK28KZywLpTxUBdfG1ACdY2E375hwIm8kwfFVe4CBgB
	nerJVojAMZ40DCmkOY7Xol+ZOUcF1KNuYB2wnSJ91zg351zUr+IUyvWdw9Mr7D8QnQ9BJYNr7RHbq
	MUMA1P0qypeuBw7Xr/MqkOXRmcyAELxsnE+TAL6LYQBec+I25KEAlN+mfhtSHrNQEJrWF9xyYq3tr
	qjLhYR4RIw9+S7CLp5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4a9d-001wg6-1s;
	Thu, 01 Jun 2023 04:43:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4a9b-001wfU-0O
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 04:43:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7125364015
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jun 2023 04:43:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B91C4339B
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jun 2023 04:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685594593;
	bh=glxEErfBF3rHdX2Urzd+1Qp5ZZmjQW4jC0j3rig2bd4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eJppZiLfpsup79yOmIoJDe2feYX0jjKFJgJ9XoDNWkX2xBnQmQWwOId5NiG1+K93q
	 lyFC1cwabbl0+RfyypvfRuKmrZSAaHfH4IwQXQglE2N4MQ0hnUYd8mfbyOwQjuyPze
	 ky0RlW+lKBET4OIwuGJPa3cC/l6uri0Yec/mKviXt3gL2TcMB26kiYu9il4yoOEbzv
	 TmxJwzPVcUAxTSFxMKKDmY0zIq8hLR+aeX1CSZ5vjG/g8yfWonEHLUtrkAraaw/AYk
	 bsNju0GBVzFj/UZ2SraPiSeNCMlcrhkF8HRPnlJlM2PXAgsA7KnuVxO3rCdxd3Ml3p
	 DuU7JLbQrT1aQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5151934a4e3so780433a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 21:43:13 -0700 (PDT)
X-Gm-Message-State: AC+VfDygzDWxnhTivYniyU4tAIhsJ6qCm03yRGYJKJtLn1tXs1bGs34B
	4if8DbwEBCGtNpiJP7y+5mxkKTjkWtP3T7ecru4=
X-Google-Smtp-Source: ACHHUZ7WYfywbSzqGOxvRRYAxq7nURM10ufCPK0jjetP4TSKkDNLozvsGovCGYbXJafAZ1bgYgshJ3tbcnwZI3XfxrM=
X-Received: by 2002:a05:6402:14c9:b0:514:9423:65a5 with SMTP id
 f9-20020a05640214c900b00514942365a5mr5538713edx.19.1685594592071; Wed, 31 May
 2023 21:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230523165502.2592-1-jszhang@kernel.org> <20230523165502.2592-3-jszhang@kernel.org>
In-Reply-To: <20230523165502.2592-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Jun 2023 12:43:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS1EcEw0VWGgd-bezKh=s7zPnFBdyuJc1wuH_SXEwoXbA@mail.gmail.com>
Message-ID: <CAJF2gTS1EcEw0VWGgd-bezKh=s7zPnFBdyuJc1wuH_SXEwoXbA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: vmlinux-xip.lds.S: remove .alternative section
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_214315_205339_78D6F313 
X-CRM114-Status: GOOD (  16.29  )
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

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gV2VkLCBNYXkgMjQs
IDIwMjMgYXQgMToxMOKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBBTFRFUk5BVElWRSBtZWNoYW5pc20gY2FuJ3Qgd29yayBvbiBYSVAsIGFuZCB0aGlz
IGlzIGFsc28gcmVmbGVjdGVkIGJ5Cj4gYmVsb3cgS2NvbmZpZyBkZXBlbmRlbmN5Ogo+Cj4gUklT
Q1ZfQUxURVJOQVRJVkUKPiAgICAgICAgIC4uLgo+ICAgICAgICAgZGVwZW5kcyBvbiAhWElQX0tF
Uk5FTAo+ICAgICAgICAgLi4uCj4KPiBTbyB0aGVyZSdzIG5vIC5hbHRlcm5hdGl2ZSBzZWN0aW9u
IGF0IGFsbCBmb3IgWElQIGNhc2UsIHJlbW92ZSBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEppc2hl
bmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwv
dm1saW51eC14aXAubGRzLlMgfCAgIDYgLS0tLS0tCj4gIDEgZmlsZXMgY2hhbmdlZCwgNiBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4LXhpcC5s
ZHMuUyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgteGlwLmxkcy5TCj4gaW5kZXggZWFiOWVk
YzNiNjMxLi41MDc2NzY0N2ZiYzYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdm1s
aW51eC14aXAubGRzLlMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92bWxpbnV4LXhpcC5sZHMu
Uwo+IEBAIC05OCwxMiArOTgsNiBAQCBTRUNUSU9OUwo+ICAgICAgICAgICAgICAgICBfX3NvY19i
dWlsdGluX2R0Yl90YWJsZV9lbmQgPSAuOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICAuID0gQUxJ
R04oOCk7Cj4gLSAgICAgICAuYWx0ZXJuYXRpdmUgOiB7Cj4gLSAgICAgICAgICAgICAgIF9fYWx0
X3N0YXJ0ID0gLjsKPiAtICAgICAgICAgICAgICAgKiguYWx0ZXJuYXRpdmUpCj4gLSAgICAgICAg
ICAgICAgIF9fYWx0X2VuZCA9IC47Cj4gLSAgICAgICB9Cj4gICAgICAgICBfX2luaXRfZW5kID0g
LjsKPgo+ICAgICAgICAgLiA9IEFMSUdOKDE2KTsKPiAtLQo+IDIuNDAuMQo+CgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
