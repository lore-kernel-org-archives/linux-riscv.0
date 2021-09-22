Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E30C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 11:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8B061131
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 11:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC8B061131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cudChf0hChsx5FnI1MuaNOe0TXzrKcsKqPkBJUSosV8=; b=seQv9VokCIRrK8
	WBpa+UnRihy/pmHgBA4Vhent0nkdsrGszWKqWWgrgKXT2ppaRpA74wsYJgXHGp1a/I2/oC8rBDJqD
	Ih6CAW2DDx99E+lMp3DwdY+FbrZFxHN71acVE7LEyVMmBlOnXSIvspoGz7bS9ausgIQiPWffY5okK
	p+EXKrZue5lluVmBBCCNjixHbnDRrFz3XfITNdKiXpOhXkToB601jxkbh1ImFHtdNTEkXJt9FGNDV
	Ee+8MNSOLdqpBvNm1j0m9azsFIy2QNJg0si2oxs8lEVMumwYnflyxzZ/pCkUoLAM/gXT/NJNNY9Nq
	syPjYrJeDMhYz55y2mLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT0QD-008JOu-QM; Wed, 22 Sep 2021 11:28:17 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT0QB-008JNM-Eb
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 11:28:16 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MRTEp-1mGgbR1rtt-00NQ5k for <linux-riscv@lists.infradead.org>; Wed, 22
 Sep 2021 13:28:12 +0200
Received: by mail-wr1-f53.google.com with SMTP id w17so5646887wrv.10
 for <linux-riscv@lists.infradead.org>; Wed, 22 Sep 2021 04:28:12 -0700 (PDT)
X-Gm-Message-State: AOAM531T7RSIx05VsBJypXNYecKSgnDoimPnjsiHMv5oP3aIUEFMASRx
 Kj4Pzhf0IQo7C9ocf3rz+yxjfojPoNkt7Gn0X3o=
X-Google-Smtp-Source: ABdhPJzt4kksrUoZmyMjHfZ1cfXQn9J73x/e0ELvJ0CKV2Dc5dZsaGo4r7nOa+BZFW/ZNbjTdCnfWEpWCsmso267J14=
X-Received: by 2002:adf:f481:: with SMTP id l1mr10127682wro.411.1632310091979; 
 Wed, 22 Sep 2021 04:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
 <72990864-5ec6-1f73-efd9-61b667a172dd@collabora.com>
 <CAK8P3a3x_EyCiPDpMK54y=Rtm-Wb08ym2TNiuAZgXhYrThcWTw@mail.gmail.com>
 <9db8c79a-f704-84ce-360b-84335f926a48@collabora.com>
In-Reply-To: <9db8c79a-f704-84ce-360b-84335f926a48@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 22 Sep 2021 13:27:55 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0w4EOsSUThTAxrARPSyt+CGJTV4V4eeNmDNdG2Qrbq9w@mail.gmail.com>
Message-ID: <CAK8P3a0w4EOsSUThTAxrARPSyt+CGJTV4V4eeNmDNdG2Qrbq9w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair23@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Namhyung Kim <namhyung@kernel.org>, 
 Jiri Olsa <jolsa@redhat.com>, linux-perf-users@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>
X-Provags-ID: V03:K1:GJnKSBRcyp5/apx6OXfXtx/QVLUoqHPASY8J6CL1MzgqN7UdW2+
 OglwB8GEUfhTm6Uk0LlEsDOBdeFDBCqMZdPRppjq+MSgaZDfPk9k9Hb7t47mIDGmuEbJnd3
 nVkARm84Dk1hx6lncBJ5/1ymP0pw8s9dIMOKOP/e3VNeDV6fdZF22zf8VkD8NnngSHdvQyE
 c9pIhhfk5uGcENc9/iclw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LFotKfLWPb4=:LJY4bn02DBNrkgdTuJTI1H
 tViNIcxvsllI/MtQWomYcETMREHuCnDMB6f+yfacO8fCEcsq/qwbLizK2OmQDQa5fpbMapqK+
 0ryhmu1zGM4Eg0zui76gzuEJRymgFtkAML3eKVQ204jcaGhSulNDc2HTTHGihl4gaNMFEtB6f
 MzgNSI3UglKaQypaxH3JagqAA3E5T66vWxJIUphjvewWbAFeH1rmD+AxOntUiql4h0+y5jyqd
 Icl1iY4/foU+DNMnGeEZ3qOmrdV7/HCMKMWDp4iPM0cWr8IPms4yBDYJKb66/RV3JDYAdxmfI
 63WnrgUl6xToBGtXbbH/oQv/vN3/JvjrdskUDw6t2uvhuHd3Zf3heQWp3q/KmDbcIq9yi+OcF
 U889LknSZRirg570YBdsmguYDp0AHwB07kG01az3hy5AntadD5mIJRT+5AFJGQYemYcDAwXjz
 ZnG6j9ayUHRdcScdhYT7hXsM0RFLrKSiwFYrb+apXPika7L1P+piAwSq3RKI+4miMKYXeYbMS
 yJgeHdJRxTmNsbmNsn6PCJkEn0HoMNcre8EXDJ1EKdZUtAnbki1E9ZmePcQuXVv8+aFDr69r9
 +/8UmZt1YKe7CovNaMPm61ctnW9RWcIs9rsYI8r9rfFPcjEVLm8cS3XnYBenI5lkQ150npIIM
 ukKVzK5DYbjquzWwuf8Ytqd1HB785VsYUN2o6vV8GV3U+rvo56K0Pw0Fw8v8U5fEb1/4fgfkx
 aPD5MtQPfbFSKdc9pL/ksrR5uhHKri2wIUrrVbHeCvrhm8t9veS5rzz3mFBwCSTyYVak2ftG3
 KgAiIZWtDan2KmV9ltayhjy3JR3UZ+jHgjwj/cP5USLj2EcjfGmSEZZgxopmxA5TFkhkfZlV9
 75FkVJ4VcsiFJ6dp9J+Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_042815_839371_6D634F49 
X-CRM114-Status: GOOD (  19.64  )
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

T24gV2VkLCBTZXAgMjIsIDIwMjEgYXQgMTowNiBBTSBBbmRyw6kgQWxtZWlkYSA8YW5kcmVhbG1l
aWRAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gw4BzIDA1OjA4IGRlIDIxLzA5LzIxLCBBcm5kIEJl
cmdtYW5uIGVzY3JldmV1Ogo+ID4gT24gVHVlLCBTZXAgMjEsIDIwMjEgYXQgMTI6NDcgQU0gQW5k
csOpIEFsbWVpZGEKPiA+IDxhbmRyZWFsbWVpZEBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiA+Pgo+
ID4+ICNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBfX1RJTUVTSVpFID09IDMyCj4gPj4gIyBkZWZp
bmUgTlJfZ2V0dGltZTY0IF9fTlJfY2xvY2tfZ2V0dGltZTY0Cj4gPj4gI2Vsc2UKPiA+PiAjIGRl
ZmluZSBOUl9nZXR0aW1lNjQgX19OUl9jbG9ja19nZXR0aW1lCj4gPj4gI2VuZGlmCj4gPj4KPiA+
PiBzdHJ1Y3QgdGltZXNwZWM2NCB7Cj4gPj4gICAgICAgICBsb25nIGxvbmcgdHZfc2VjOyAgICAg
ICAvKiBzZWNvbmRzICovCj4gPj4gICAgICAgICBsb25nIGxvbmcgdHZfbnNlYzsgICAgICAvKiBu
YW5vc2Vjb25kcyAqLwo+ID4+IH07Cj4gPj4KPiA+PiBpbnQgZ2V0dGltZTY0KGNsb2NrX3QgY2xv
Y2tpZCwgc3RydWN0IHRpbWVzcGVjNjQgKnR2KQo+ID4+IHsKPiA+PiAgICAgICAgIHJldHVybiBz
eXNjYWxsKE5SX2dldHRpbWU2NCwgY2xvY2tpZCwgdHYpOwo+ID4+IH0KPiA+Pgo+ID4+IFRoZW4g
d2UgY2FuIGp1c3QgdXNlICZ0aW1lb3V0IGF0IF9fTlJfZnV0ZXhfdGltZTY0IGZvciAzMmJpdCBh
cmNoIGFuZCBhdAo+ID4+IF9fTlJfZnV0ZXggZm9yIDY0Yml0IGFyY2guCj4gPgo+ID4gVGhpcyBp
cyBzdGlsbCBicm9rZW4gd2hlbiB5b3UgZGlzYWJsZSBDT05GSUdfQ09NUEFUXzMyQklUX1RJTUUs
Cj4gPiB3aGljaCBkaXNhYmxlcyBhbGwgc3lzdGVtIGNhbGxzIHRoYXQgdGFrZSB0aW1lMzIgYXJn
dW1lbnRzLgo+ID4KPgo+IE9oLCBJIHRoaW5rIG15IHBvaW50IHdhcyBjb25mdXNpbmcgdGhlbi4g
TXkgc3VnZ2VzdGlvbiB3YXMgdG8gdXNlIG9ubHkKPiB0aGUgZnV0ZXggZW50cnkgcG9pbnRzIHRo
YXQgYWNjZXB0cyB0aW1lNjQsIGFuZCB0byBhbHdheXMgdXNlCj4gY2xvY2tfZ2V0dGltZSB0aGF0
IHVzZXMgdGltZTY0LCBmb3IgYWxsIHBsYXRmb3Jtcy4gVGhlbiBpdCB3aWxsIHdvcmsgaWYKPiB3
ZSBkaXNhYmxlIENPTkZJR19DT01QQVRfMzJCSVRfVElNRS4KClllcywgdGhhdCB3b3VsZCBiZSBv
ay4gSXQgZG9lcyByZXF1aXJlIHVzaW5nIGF0IGxlYXN0IGxpbnV4LTUuMSwgYnV0IHdlCnBlcmYg
aXMgYWxyZWFkeSBzb3J0LW9mIHRpZWQgdG8gdGhlIGtlcm5lbCB2ZXJzaW9uLgoKICAgICAgICBB
cm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
