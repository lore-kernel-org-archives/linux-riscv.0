Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC8C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5ZZ+MNFTX2bKU0uvZ1YV6+5LZkYBt8IszIYPKrvra8=; b=jhu0ujUNXsX2Fp
	lU8HPJIBEccVCiIpHhLmwbdnUe6OgCxkf1RGPA6KoVkadJYNDjjPFrb0mpTGc9NwQLJHxi0Mbcr6v
	Oc0c/RTr2euHh8bEOMj4+JI86gV1Aa7WkpX4HXj8QiDlt8v45OG9mF869cj5qdAeAFUxJs4xnGLX6
	ThKTk9pzg8miQfTp3c+LKWqWR5NJg0k5mpyuxHhpxMJx8ZuNkuaDP4ALAvU6Nsf+bXPUWh5VfwEXV
	XVv9hTea0AijgoRL9WiQWMJzMqOIFSO+hzMU1/p399PLLoTQ1h4o4LjbE/4eBzMI+4xxijwwaS3UL
	UAOIct/KhLwp7xQfmofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0Lr-008CBZ-6E; Wed, 04 Jan 2023 09:46:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD00d-00819b-Ue
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 09:24:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1662DCE1033
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 09:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C071EC43398
	for <linux-riscv@lists.infradead.org>; Wed,  4 Jan 2023 09:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672824266;
	bh=GvYqWw4SE9AcM8QrU4Qwt+om53eTrQ5s18qUblcdkWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mPszRvtkBs16pd6Wpj9MpuXjPIr2EmyWwDv6NMH2JPZ84xbQY0GrUEoAZiSWSlm4J
	 NxevIKpmCiFK4l5Qe06ZBIarsxvmeG7oReGpXA2amo3i3pRYbD1p5ri6F7tvZ4v38v
	 tK58zKlz5/L40f6J9VrgRucGIRTecXzNRDdgfoOGoIxfjdk8nAntphVsFKk73bwfV+
	 v6pfMDO4uDq4+GZ7bflnAu0emOKYUlAqfBHyXGCKjU2iu5QpFUxs9iOMJc3jsdOxRN
	 CY5alF37K7u+lSpvGlDRqBabvz94w51Y18l5pTdllf+60M98GAp6vdRCCRSeq5R34V
	 AfT5rYNHWgSqw==
Received: by mail-ej1-f54.google.com with SMTP id kw15so81006329ejc.10
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 01:24:26 -0800 (PST)
X-Gm-Message-State: AFqh2kppE0IXmu18f2pf/MlXsPRfKRMvnb78BDqDdPeE0Kll1O9ju5/k
	L4OCFqHBhpUboKS8sFaKWloXSoKeVY+j+lECiJw=
X-Google-Smtp-Source: AMrXdXsFW2us9z5yyQvDN4SKkyjvd+/elktZohLGuvFc4Vz2/ctRKDH6MpNv1ejW9uoVH6PY8/KE4gpl5FlETL0waDA=
X-Received: by 2002:a17:907:1de4:b0:7c0:dab0:d722 with SMTP id
 og36-20020a1709071de400b007c0dab0d722mr2522829ejc.353.1672824264944; Wed, 04
 Jan 2023 01:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20230104074146.578485-1-uwu@icenowy.me> <20230104074146.578485-3-uwu@icenowy.me>
 <CAJF2gTSb4qEPHw8hy1ro+UMoyKQaoQESNGveSGLdPL=cXac8jQ@mail.gmail.com> <a2a8c7522b9b57f074d6962511b6d779cfd4b56b.camel@icenowy.me>
In-Reply-To: <a2a8c7522b9b57f074d6962511b6d779cfd4b56b.camel@icenowy.me>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 4 Jan 2023 17:24:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTO3jx8FqMVRmfgkjO02sCVx2SVbe-Sn1uKXojyn8RDaA@mail.gmail.com>
Message-ID: <CAJF2gTTO3jx8FqMVRmfgkjO02sCVx2SVbe-Sn1uKXojyn8RDaA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] riscv: use VA+PA variant of CMO macros for DMA synchorization
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Holland <samuel@sholland.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_012433_996160_4FD7B89E 
X-CRM114-Status: GOOD (  21.66  )
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

T24gV2VkLCBKYW4gNCwgMjAyMyBhdCA0OjU5IFBNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5
Lm1lPiB3cm90ZToKPgo+IOWcqCAyMDIzLTAxLTA05pif5pyf5LiJ55qEIDE2OjUwICswODAw77yM
R3VvIFJlbuWGmemBk++8mgo+ID4gT24gV2VkLCBKYW4gNCwgMjAyMyBhdCAzOjQzIFBNIEljZW5v
d3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPiB3cm90ZToKPiA+ID4KPiA+ID4gRE1BIHN5bmNob3Jp
emF0aW9uIGlzIGRvbmUgb24gUEEgYW5kIHRoZSBWQSBpcyBjYWxjdWxhdGVkIGZyb20gdGhlCj4g
PiA+IFBBLgo+ID4gPgo+ID4gPiBVc2UgdGhlIGFsdGVybmF0aXZlIG1hY3JvIHZhcmlhbnQgdGhh
dCB0YWtlcyBib3RoIFZBIGFuZCBQQSBhcwo+ID4gPiBwYXJhbWV0ZXJzLCB0aHVzIGluIGNhc2Ug
dGhlIElTQSBleHRlbnNpb24gdXNlZCBzdXBwb3J0IFBBCj4gPiA+IGRpcmVjdGx5LCB0aGUKPiA+
ID4gb3ZlcmhlYWQgZm9yIHJlLWNvbnZlcnRpbmcgVkEgdG8gUEEgY2FuIGJlIG9taXR0ZWQuCj4g
PiA+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiAtLS0K
PiA+ID4gIGFyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMgfCA4ICsrKystLS0tCj4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPgo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyBiL2FyY2gv
cmlzY3YvbW0vZG1hLQo+ID4gPiBub25jb2hlcmVudC5jCj4gPiA+IGluZGV4IGQ5MTllZmFiNmVi
YS4uYTc1MWY0YWVjZTYyIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25j
b2hlcmVudC5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiA+
ID4gQEAgLTE5LDEzICsxOSwxMyBAQCB2b2lkIGFyY2hfc3luY19kbWFfZm9yX2RldmljZShwaHlz
X2FkZHJfdAo+ID4gPiBwYWRkciwgc2l6ZV90IHNpemUsCj4gPiA+Cj4gPiA+ICAgICAgICAgc3dp
dGNoIChkaXIpIHsKPiA+ID4gICAgICAgICBjYXNlIERNQV9UT19ERVZJQ0U6Cj4gPiA+IC0gICAg
ICAgICAgICAgICBBTFRfQ01PX09QKGNsZWFuLCB2YWRkciwgc2l6ZSwKPiA+ID4gcmlzY3ZfY2Jv
bV9ibG9ja19zaXplKTsKPiA+ID4gKyAgICAgICAgICAgICAgIEFMVF9DTU9fT1BfVlBBKGNsZWFu
LCB2YWRkciwgcGFkZHIsIHNpemUsCj4gPiA+IHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiBB
TFRfQ01PX09QIC0+IEFMVF9DTU9fT1BfVlBBLCBpcyB0aGUgcmVuYW1pbmcgbmVjZXNzYXJ5Pwo+
Cj4gSSBkaWRuJ3QgcmVuYW1lIHRoZSBvcmlnaW5hbCBBTFRfQ01PX09QLCBBTFRfQ01PX09QX1ZQ
QSBpcyBzb21ldGhpbmcKPiBuZXcuClRoZSAjI19WUEEgaXMgcmVhbGx5IHN0cmFuZ2UuCgpIb3cg
YWJvdXQ6CkFMVF9DTU9fT1AgICAgICAgICAgLT4gQUxUX0NNT19PUF9WQQpBTFRfQ01PX09QX1ZQ
QSAtPiBBTFRfQ01PX09QCgo+Cj4gPgo+ID4gT3RoZXJzOgo+ID4gUmV2aWV3ZWQtYnk6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4KPiA+ID4gICAgICAgICAgICAgICAgIGJyZWFrOwo+
ID4gPiAgICAgICAgIGNhc2UgRE1BX0ZST01fREVWSUNFOgo+ID4gPiAtICAgICAgICAgICAgICAg
QUxUX0NNT19PUChjbGVhbiwgdmFkZHIsIHNpemUsCj4gPiA+IHJpc2N2X2Nib21fYmxvY2tfc2l6
ZSk7Cj4gPiA+ICsgICAgICAgICAgICAgICBBTFRfQ01PX09QX1ZQQShjbGVhbiwgdmFkZHIsIHBh
ZGRyLCBzaXplLAo+ID4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gPiAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gPiA+ICAgICAgICAgY2FzZSBETUFfQklESVJFQ1RJT05BTDoKPiA+ID4g
LSAgICAgICAgICAgICAgIEFMVF9DTU9fT1AoZmx1c2gsIHZhZGRyLCBzaXplLAo+ID4gPiByaXNj
dl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gPiArICAgICAgICAgICAgICAgQUxUX0NNT19PUF9WUEEo
Zmx1c2gsIHZhZGRyLCBwYWRkciwgc2l6ZSwKPiA+ID4gcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsK
PiA+ID4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgICAgIGRlZmF1bHQ6Cj4gPiA+
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gQEAgLTQyLDcgKzQyLDcgQEAgdm9pZCBhcmNo
X3N5bmNfZG1hX2Zvcl9jcHUocGh5c19hZGRyX3QgcGFkZHIsCj4gPiA+IHNpemVfdCBzaXplLAo+
ID4gPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ICAgICAgICAgY2FzZSBETUFfRlJPTV9E
RVZJQ0U6Cj4gPiA+ICAgICAgICAgY2FzZSBETUFfQklESVJFQ1RJT05BTDoKPiA+ID4gLSAgICAg
ICAgICAgICAgIEFMVF9DTU9fT1AoZmx1c2gsIHZhZGRyLCBzaXplLAo+ID4gPiByaXNjdl9jYm9t
X2Jsb2NrX3NpemUpOwo+ID4gPiArICAgICAgICAgICAgICAgQUxUX0NNT19PUF9WUEEoZmx1c2gs
IHZhZGRyLCBwYWRkciwgc2l6ZSwKPiA+ID4gcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiA+ID4g
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgICAgIGRlZmF1bHQ6Cj4gPiA+ICAgICAg
ICAgICAgICAgICBicmVhazsKPiA+ID4gLS0KPiA+ID4gMi4zOC4xCj4gPiA+Cj4gPgo+ID4KPgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
