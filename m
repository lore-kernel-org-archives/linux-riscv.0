Return-Path: <SRS0=NJ9D=AF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13972C433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 01:27:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E742098B
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 01:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CAc/J+VO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WVLsE6GK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3E742098B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8UDb1jkR6JaqP+O5OPzIzQ1xaUjcG+ZfFRMu2Bda8lc=; b=CAc/J+VO/RziNReRjSx24TBwX
	hEsa0gavkFu4GaBhr3lW1oPG19UlfdGMI6XPUqomK8ODPCJXuJvkEsIhlaF3H9k2SW0+Uo98YS7My
	qTb6XcXI0HFZma+A6rpcYz+DlCFdgG44hEXrGT/rdPR0p9fKxFJEUakyBL09g7QNHSZCotW4Zj0/D
	ugTmM70pBDvzAqQTlMbIcqIRMKEjZVxSBtlFt5lnCL4T6o61zOG2hFg9OnGVGsDnAxV9vLOgiO92B
	IaJ1yrOP2IcD1uvb6LRdjAA5ieSh+7MwiNefZ398aKHq9f4wzYDxTljjFe+qlQtB05hTV7fRRDx76
	5QAIdoKcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnuC1-00005P-IU; Wed, 24 Jun 2020 01:27:13 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnuBz-0008Vl-9W
 for linux-riscv@lists.infradead.org; Wed, 24 Jun 2020 01:27:12 +0000
Received: by mail-pj1-x1042.google.com with SMTP id i12so383511pju.3
 for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2020 18:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5WqxirMnj7b1Z9cfj2+T6ttey+7IO6/UmXnBcAnlL5o=;
 b=WVLsE6GKyBKghjtlRRoqw+jK/TkSzt8Y8R9lLFgI6U17GJv2Jvt3eaK4wnyXiYkWGe
 0Q6xvjT2TTBQmCmpzfKIdWZyrA44Rsvtn4AEzq9q2mBI/8/lZ67M1xVML+5ZTrZ1fmcY
 wH91F75UMO6Rzq9wkwYCenEUF3tWyu/dgat633p8XzrFPm8nuv14uQ8sIwOPg+YsdWjl
 6fze+c9CqheqViv+bIGiXHVV/CKxC/q7Jd3UTEiVoXfCn1xkK6q+ULskWtoj0BzLLbD4
 uhFIYPejKK1BB/uahHDwsSDmuEt2YYO9fDJkURJsuxbjWUCqR9T5TGfpO08bN5IbfThA
 bmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5WqxirMnj7b1Z9cfj2+T6ttey+7IO6/UmXnBcAnlL5o=;
 b=QFL13XalDP/2qTyqWHllPtT8NuK2AWA6THQGzsX1B9HvxbqLvvmy0b9O+omOazSMZ2
 Mvoqgj+CFf5dcGmDzeq8m6MzL+GwO7XySLOWevHoSv9YSvXDaz1a5OWW8S6hBuEhQ0IY
 3BgHO/skSp6mPiaJ6RSC1jcE/5vcHp1b0lQcoO4OEne4FqgQKX56aISmR6dJ1D3onl4C
 cogUw2KaCGIQJ/xA+3BbFql3oXNc8Baq+AfMcJxmg/uaPzmEyk1EVNsq4eh6CPh8OxiT
 2pI5KFHxpX8fwLI/MrVXAlV4pewbMZRxTRtRe62FtH72POQ7XoWH/rcXFiYVQmpx8b+k
 R+HQ==
X-Gm-Message-State: AOAM531uJAWR2Yy8imoqqtlDEbv/RevszJVTMUNJ1Khog8ijiF/dQfmA
 BbaRT/AlR27KxlsStXcBYkLH+UvEuADHu7wgBYpBAA==
X-Google-Smtp-Source: ABdhPJzeq5txjKMUQAVr9+e0vQTIzzj8xHpGdSgvkgQr8uapF37yQ1dDH+5b3uyCoSICkGIBBLsUTaPuMFymKS4CHCM=
X-Received: by 2002:a17:90a:acf:: with SMTP id
 r15mr27081700pje.171.1592962027133; 
 Tue, 23 Jun 2020 18:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <1592905854-60833-1-git-send-email-guoren@kernel.org>
 <CAEbi=3daXn-HKj2Rt+tot_JmvrNBFsUFWxeKfp=6ycjWuDtdRQ@mail.gmail.com>
In-Reply-To: <CAEbi=3daXn-HKj2Rt+tot_JmvrNBFsUFWxeKfp=6ycjWuDtdRQ@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 24 Jun 2020 09:26:56 +0800
Message-ID: <CABvJ_xjYHiNS6OygtvGnStn-++XRKP3CxcTOr-MtA8sN8WmdVA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fixup __vdso_gettimeofday broke dynamic ftrace
To: Greentime Hu <green.hu@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Alan Kao <alankao@andestech.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgOToyNyBQTSBHcmVlbnRpbWUgSHUgPGdyZWVuLmh1QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0NuaciDIz
5pelIOmAseS6jCDkuIvljYg1OjUy5a+r6YGT77yaCj4gPgo+ID4gRnJvbTogR3VvIFJlbiA8Z3Vv
cmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IEZvciBsaW51eC01LjgtcmMxLCBlbmFibGUg
ZnRyYWNlIG9mIHJpc2N2IHdpbGwgY2F1c2UgYm9vdCBwYW5pYzoKPiA+Cj4gPiBbICAgIDIuMzg4
OTgwXSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPiA+IFsgICAgMi41Mjk5MzhdIGlu
aXRbMzldOiB1bmhhbmRsZWQgc2lnbmFsIDQgY29kZSAweDEgYXQgMHgwMDAwMDAzZmY0NDllMDAw
Cj4gPiBbICAgIDIuNTMxMDc4XSBDUFU6IDAgUElEOiAzOSBDb21tOiBpbml0IE5vdCB0YWludGVk
IDUuOC4wLXJjMS1kaXJ0eSAjMTMKPiA+IFsgICAgMi41MzI3MTldIGVwYzogMDAwMDAwM2ZmNDQ5
ZTAwMCByYSA6IDAwMDAwMDNmZjQ0OWU5NTQgc3AgOiAwMDAwMDAzZmZmZWRiOTAwCj4gPiBbICAg
IDIuNTM0MDA1XSAgZ3AgOiAwMDAwMDAwMDAwMGU4NTI4IHRwIDogMDAwMDAwM2ZmNDQ5ZDgwMCB0
MCA6IDAwMDAwMDAwMDAwMDAwMWUKPiA+IFsgICAgMi41MzQ5NjVdICB0MSA6IDAwMDAwMDAwMDAw
MDAwMGEgdDIgOiAwMDAwMDAzZmZmZWRiODllIHMwIDogMDAwMDAwM2ZmZmVkYjkyMAo+ID4gWyAg
ICAyLjUzNjI3OV0gIHMxIDogMDAwMDAwM2ZmZmVkYjk0MCBhMCA6IDAwMDAwMDNmZjQzZDRiMmMg
YTEgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDIuNTM3MzM0XSAgYTIgOiAwMDAwMDAwMDAw
MDAwMDAxIGEzIDogMDAwMDAwMDAwMDAwMDAwMCBhNCA6IGZmZmZmZmZmZmJhZDgwMDAKPiA+IFsg
ICAgMi41Mzg0NjZdICBhNSA6IDAwMDAwMDNmZjQ0OWU5M2EgYTYgOiAwMDAwMDAwMDAwMDAwMDAw
IGE3IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAyLjUzOTUxMV0gIHMyIDogMDAwMDAwMDAw
MDAwMDAwMCBzMyA6IDAwMDAwMDNmZjQ0ODQxMmMgczQgOiAwMDAwMDAwMDAwMDAwMDEwCj4gPiBb
ICAgIDIuNTQxMjYwXSAgczUgOiAwMDAwMDAwMDAwMDAwMDE2IHM2IDogMDAwMDAwMDAwMDBkMGEz
MCBzNyA6IDAwMDAwMDNmZmZlZGJhNzAKPiA+IFsgICAgMi41NDIxNTJdICBzOCA6IDAwMDAwMDAw
MDAwMDAwMDAgczkgOiAwMDAwMDAwMDAwMDAwMDAwIHMxMDogMDAwMDAwM2ZmZmVkYjk2MAo+ID4g
WyAgICAyLjU0MzMzNV0gIHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAwMDAwMDAwMDAw
MDAgdDQgOiAwMDAwMDAzZmZmZWRiOGEwCj4gPiBbICAgIDIuNTQ0NDcxXSAgdDUgOiAwMDAwMDAw
MDAwMDAwMDAwIHQ2IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAyLjU0NTczMF0gc3RhdHVz
OiAwMDAwMDAwMDAwMDA0MDIwIGJhZGFkZHI6IDAwMDAwMDAwNDY0YzQ1N2YgY2F1c2U6IDAwMDAw
MDAwMDAwMDAwMDIKPiA+IFsgICAgMi41NDk4NjddIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5n
OiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBleGl0Y29kZT0weDAwMDAwMDA0Cj4gPiBbICAgIDIu
NTUxMjY3XSBDUFU6IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQgNS44LjAtcmMxLWRp
cnR5ICMxMwo+ID4gWyAgICAyLjU1MjA2MV0gQ2FsbCBUcmFjZToKPiA+IFsgICAgMi41NTI2MjZd
IFs8ZmZmZmZmZTAwMDIwMzc0YT5dIHdhbGtfc3RhY2tmcmFtZSsweDAvMHhjNAo+ID4gWyAgICAy
LjU1MzQ4Nl0gWzxmZmZmZmZlMDAwMjAzOWY0Pl0gc2hvd19zdGFjaysweDQwLzB4NGMKPiA+IFsg
ICAgMi41NTM5OTVdIFs8ZmZmZmZmZTAwMDU0YTZhZT5dIGR1bXBfc3RhY2srMHg3YS8weDk4Cj4g
PiBbICAgIDIuNTU0NjE1XSBbPGZmZmZmZmUwMDAyMGI5Yjg+XSBwYW5pYysweDExNC8weDJmNAo+
ID4gWyAgICAyLjU1NTM5NV0gWzxmZmZmZmZlMDAwMjBlYmQ2Pl0gZG9fZXhpdCsweDg5Yy8weDhj
Mgo+ID4gWyAgICAyLjU1NTk0OV0gWzxmZmZmZmZlMDAwMjBmOTMwPl0gZG9fZ3JvdXBfZXhpdCsw
eDNhLzB4OTAKPiA+IFsgICAgMi41NTY3MTVdIFs8ZmZmZmZmZTAwMDIxOWUwOD5dIGdldF9zaWdu
YWwrMHhlMi8weDZlNgo+ID4gWyAgICAyLjU1NzM4OF0gWzxmZmZmZmZlMDAwMjAyZDcyPl0gZG9f
bm90aWZ5X3Jlc3VtZSsweDZhLzB4MzdhCj4gPiBbICAgIDIuNTU4MDg5XSBbPGZmZmZmZmUwMDAy
MDFjMTY+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4Ywo+ID4KPiA+ICJyYToweDNmZjQ0OWU5
NTQiIGlzIHRoZSByZXR1cm4gYWRkcmVzcyBvZiAiY2FsbCBfbWNvdW50IiBpbiB0aGUKPiA+IHBy
b2xvZ3VlIG9mIF9fdmRzb19nZXR0aW1lb2ZkYXkoKS4gV2l0aG91dCBwcm9wZXIgcmVsb2NhdGUs
IHBjIGptcAo+ID4gdG8gMHgwMDAwMDAzZmY0NDllMDAwICh2ZHNvIG1hcCBiYXNlKSB3aXRoIGEg
aWxsZWdhbCBpbnN0cnVjdGlvbgo+ID4gdHJhcC4KPiA+Cj4gPiBUaGUgc29sdXRpb24gY29tZXMg
ZnJvbSBhcmNoL2FybTY0L2tlcm5lbC92ZHNvL01ha2VmaWxlOgo+ID4KPiA+IENGTEFHU19SRU1P
VkVfdmdldHRpbWVvZmRheS5vID0gJChDQ19GTEFHU19GVFJBQ0UpIC1PcyAkKENDX0ZMQUdTX1ND
UykKPiA+Cj4gPiAgLSBDQ19GTEFHU19TQ1MgaXMgU2hhZG93Q2FsbFN0YWNrIGZlYXR1cmUgaW4g
Q2xhbmcgYW5kIG9ubHkKPiA+ICAgIGltcGxlbWVudGVkIGZvciBhcm02NCwgbm8gdXNlIGZvciBy
aXNjdi4KPiA+Cj4gPiBUaGUgYnVnIGNvbWVzIGZyb20gdGhlIGZvbGxvd2luZyBjb21taXQ6Cj4g
Pgo+ID4gYWQ1ZDExMjJiODJmICgicmlzY3Y6IHVzZSB2RFNPIGNvbW1vbiBmbG93IHRvIHJlZHVj
ZSB0aGUgbGF0ZW5jeSBvZiB0aGUgdGltZS1yZWxhdGVkIGZ1bmN0aW9ucyIpCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gQ2M6IFZp
bmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gPiBDYzogQXRpc2ggUGF0cmEg
PGF0aXNoLnBhdHJhQHdkYy5jb20+Cj4gPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lcmRhYmJl
bHRAZ29vZ2xlLmNvbT4KPiA+IENjOiBBbGFuIEthbyA8YWxhbmthb0BhbmRlc3RlY2guY29tPgo+
ID4gQ2M6IEdyZWVudGltZSBIdSA8Z3JlZW4uaHVAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgYXJj
aC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQo+ID4gaW5kZXgg
MzhiYTU1Yi4uMzA3OTkzNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28v
TWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiA+IEBA
IC0yNyw2ICsyNyw5IEBAIG9iai12ZHNvIDo9ICQoYWRkcHJlZml4ICQob2JqKS8sICQob2JqLXZk
c28pKQo+ID4gIG9iai15ICs9IHZkc28ubyB2ZHNvLXN5bXMubwo+ID4gIENQUEZMQUdTX3Zkc28u
bGRzICs9IC1QIC1DIC1VJChBUkNIKQo+ID4KPiA+ICsjIERpc2FibGUgLXBnIHRvIHByZXZlbnQg
aW5zZXJ0IGNhbGwgc2l0ZQo+ID4gK0NGTEFHU19SRU1PVkVfdmdldHRpbWVvZmRheS5vID0gJChD
Q19GTEFHU19GVFJBQ0UpIC1Pcwo+ID4gKwo+ID4gICMgRGlzYWJsZSBnY292IHByb2ZpbGluZyBm
b3IgVkRTTyBjb2RlCj4gPiAgR0NPVl9QUk9GSUxFIDo9IG4KPiA+Cj4KPiBUaGFuayB5b3UsIEd1
by4KPiBJIGVuY291bnRlciB0aGUgc2FtZSBidWcgaW4gdjUuOC1yYzIuCj4gVGhpcyBwYXRjaCB3
b3Jrcy4KPgo+IFRlc3RlZC1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNv
bT4KClNvcnJ5IGZvciBhbnkgaW5jb252ZW5pZW5jZSBjYXVzZWQgYnkgbXkgbWlzdGFrZSBhbmQg
dGhhbmsgeW91IGZvcgpyZXNvbHZpbmcgdGhpcyBidWcuCkl0IGxvb2tzIGdvb2QgdG8gbWUuClJl
dmlld2VkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
