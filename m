Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B2DC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpf1xV1SSFlF91VPQTyGg55VEg2qqC4pRMAL/k2bi84=; b=zYh0qyVBPR+MLL
	y/4algBZXCoh+8OUsSM5945Ey/zSepOjFl+b0qpbQk7NGmMKZmTEYi+IED4ul1xWjLwk72MEzkMrX
	ibIaZgkW1hPZamFxfNTifWf+Tl/1eV7RcNpQ2ftMagGRt7A064N7twDG5fmFBAckSHH/d4YPK4Bc0
	yHibK4OYszNxJrDmBQEQcTGgtTvCxBz8BPFjwTBrvhVxvTv2VUuNqsnMXc0nA33zWVpluy1s8YZWr
	CY7zArMkmvF6KotCoCvmn1y6GLqxDvEm6lNJu7X+tEtL61o5aNNKKarfaYLNX004WVYB3Jk2jutpK
	jO8qB0xGJeo9PeKskruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owgND-003Boz-Nk; Sun, 20 Nov 2022 09:12:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owgNA-003BoU-Sy
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 09:12:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id t17so7369794pjo.3
        for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 01:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rekVEDKKlijw7I/2Qf31vZa1TulCD9iTi5HOGYS/PLk=;
        b=C2WZax14f5SkUzd4O3PNrmtFTC/w+YH5ebqMXfcH5DvU4TzZyyBGCzDr3AOcw3fNj5
         yJhHkijjHf+eUnb88FlsHynTlxrnXc7SEueO54KK8sr7kJHOen0hN+SYLYqUuhQGdGbG
         lXT3Ohp3KRut6/aD7erwPb2t1q5z9Te/DBjDNo5risNzwsPlW3cysG6XWJSR7UUt/WLh
         hWDd4+mNeyH8EbNto9Taj2FCa53oA5hPqlNC4UoJhi3/balQ3LnZ1FPaLf8d/aDPCrmj
         pLoOdC8hzJn+5tmKYKnE6BLOx4J2trcjpOaFeEocSSmeSErZ9Dr2cbGMtaBRXHAtEnVq
         ZaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rekVEDKKlijw7I/2Qf31vZa1TulCD9iTi5HOGYS/PLk=;
        b=K08xX/0h0TbVVP+w8nD0+Z1D7X6U1NPpvefSIJ5GklLdUPAFu2o+fq+gDxzaHaX3c+
         gcThnGGRk1G7Jm0z6lV0jdgZqrsN470L9/OX2RVgszg1GaeueTeBglP7TIS6tcSSdPtK
         KqOtaBD3G884qan285D517M0N48lN0xK+HIEzfvbQBgal5HuNt/jN0tH0KNE16Uktzgb
         94uQO4/gOOsXXaShhkKVgmlnjqmEvRDG40iAoiWwqGnjKJ7Lla+Yh23OCO+3o15tYhbZ
         yJfNthP9wLKZ0P7NouC2s5EvEyhYP8Ad+b8vpyS/baJ2+efotGUlWt4DoflafxgSDIrp
         A+GQ==
X-Gm-Message-State: ANoB5pmxxe1rFgT1NwlTyYM1rKQTJm3wjizfapvyKsN+GJR7VXXDLVmG
	YfwOckTPIxhWrSodPvMS6LgW8UOwP/ndOewd7Zs=
X-Google-Smtp-Source: AA0mqf4vTe0Ybq/3/VHIqM7d+6C/bTPB1GxUDmLT8wRMuvBKK2ijhCybePhbgLPaIiIC6xTvBPTzc4WVdcv3mBQcRPA=
X-Received: by 2002:a17:902:6847:b0:183:6555:38ef with SMTP id
 f7-20020a170902684700b00183655538efmr6808724pln.157.1668935538643; Sun, 20
 Nov 2022 01:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20221118173217.888077-1-suagrfillet@gmail.com> <CAJF2gTTHWtm-nYD0SdcvnxAXkiNOVBZAkVx8SkJL2w-K9iaWZQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTHWtm-nYD0SdcvnxAXkiNOVBZAkVx8SkJL2w-K9iaWZQ@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Sun, 20 Nov 2022 09:12:06 +0000
Message-ID: <CAAYs2=hvw0eKDpZtxmQzqXrgvfoj+XD9qCjcAmddZLQvOEqtHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] riscv/ftrace: make function graph use ftrace directly
To: Guo Ren <guoren@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_011220_978495_FB223CE8 
X-CRM114-Status: GOOD (  23.67  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDIw5pel5ZGo5pelIDA0
OjI25YaZ6YGT77yaCj4KPiBPbiBTYXQsIE5vdiAxOSwgMjAyMiBhdCAxOjMyIEFNIFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSW4gUklTQy1WIGFyY2hp
dGVjdHVyZSwgd2hlbiB3ZSBlbmFibGUgdGhlIGZ0cmFjZV9ncmFwaCB0cmFjZXIgb24gc29tZQo+
ID4gZnVuY3Rpb25zLCB0aGUgZnVuY3Rpb24gdHJhY2luZ3Mgb24gb3RoZXIgZnVuY3Rpb25zIHdp
bGwgc3VmZmVyIGV4dHJhCj4gPiBncmFwaCB0cmFjaW5nIHdvcmsuIEluIGVzc2VuY2UsIGdyYXBo
X29wcyBpc24ndCBsaW1pdGVkIGJ5IGl0cyBmdW5jX2hhc2gKPiA+IGR1ZSB0byB0aGUgZ2xvYmFs
IGZ0cmFjZV9ncmFwaF9bcmVnc11fY2FsbCBsYWJlbC4gVGhhdCBzaG91bGQgYmUgY29ycmVjdGVk
Lgo+ID4KPiA+IFdoYXQgaW5zcGlyZXMgbWUgaXMgdGhlIGNvbW1pdCAwYzA1OTNiNDVjOWIgKCJ4
ODYvZnRyYWNlOiBNYWtlIGZ1bmN0aW9uCj4gPiBncmFwaCB1c2UgZnRyYWNlIGRpcmVjdGx5Iikg
dGhhdCB1c2VzIGdyYXBoX29wczo6ZnVuYyBmdW5jdGlvbiB0byBpbnN0YWxsCj4gPiByZXR1cm5f
aG9va2VyIGFuZCBtYWtlcyB0aGUgZnVuY3Rpb24gY2FsbGVkIGFnYWluc3QgaXRzIGZ1bmNfaGFz
aC4KPiA+Cj4gPiBUaGlzIHNlcmllcyBvZiBwYXRjaGVzIG1ha2VzIGZ1bmN0aW9uIGdyYXBoIHVz
ZSBmdHJhY2UgZGlyZWN0bHkgZm9yIHJpc2N2Lgo+ID4KPiA+IElmIEZUUkFDRV9XSVRIX1JFR1Mg
aXNuJ3QgZGVmaW5lZCwgZnRyYWNlX2NhbGxlciBrZWVwcyBmdHJhY2VfZ3JhcGhfY2FsbAo+ID4g
c28gdGhhdCBpdCBjYW4gYmUgcmVwbGFjZWQgd2l0aCB0aGUgY2FsbGluZyBvZiBwcmVwYXJlX2Z0
cmFjZV9yZXR1cm4gYnkKPiA+IHRoZSBlbmFibGUvZGlzYWJsZSBoZWxwZXIuCj4gPgo+ID4gQXMg
Zm9yIGRlZmluaW5nIEZUUkFDRV9XSVRIX1JFR1MsIGZ0cmFjZV9jYWxsZXIgaXMgYWRqdXN0ZWQg
dG8gc2F2ZSB0aGUKPiA+IG5lY2Vzc2FyeSByZWdzIGFnYWluc3QgdGhlIHB0X3JlZ3MgbGF5b3V0
LCBzbyBpdCBjYW4gcmVhc29uYWJseSBjYWxsIHRoZQo+ID4gZ3JhcGhfb3BzOjpmdW5jIGZ1bmN0
aW9uIC0gZnRyYWNlX2dyYXBoX2Z1bmMuIEFuZCBmdHJhY2VfZ3JhcGhfW3JlZ3NdX2NhbGwKPiA+
IGFuZCBpdHMgZW5hYmxlL2Rpc2FibGUgaGVscGVyIGFyZW4ndCBuZWVkZWQuCj4gPgo+ID4gVGhl
IHRlc3RzIGdlbmVyYXRlZCBieSBDT05GSUdfRlRSQUNFX1NUQVJUVVBfVEVTVCBoYXZlIHBhc3Nl
ZCBpbiB0aGUgbG9jYWwKPiA+IHFlbXUtc3lzdGVtLXJpc2N2NjQgdmlydCBtYWNoaW5lLiBUaGUg
Zm9sbG93aW5nIGlzIHRoZSBsb2cgZHVyaW5nIHN0YXJ0dXAuCj4gPgo+ID4gYGBgCj4gPiBOb3Yg
MTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogVGVzdGluZyB0cmFjZXIgZnVuY3Rpb246IFBBU1NF
RAo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6IFRlc3RpbmcgZHluYW1pYyBmdHJh
Y2U6IFBBU1NFRAo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6IFRlc3RpbmcgZHlu
YW1pYyBmdHJhY2Ugb3BzICMxOgo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6ICgx
IDAgMSAwIDApCj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogKDEgMSAyIDAgMCkK
PiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiAoMiAxIDMgMCAzNjUpCj4gPiBOb3Yg
MTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogKDIgMiA0IDAgMzk5KQo+ID4gTm92IDE1IDAzOjA3
OjEzIHN0YWdlNCBrZXJuZWw6ICgzIDIgNCAwIDE0NjA3MSkKPiA+IE5vdiAxNSAwMzowNzoxMyBz
dGFnZTQga2VybmVsOiAoMyAzIDUgMCAxNDYxMDUpIFBBU1NFRAo+ID4gTm92IDE1IDAzOjA3OjEz
IHN0YWdlNCBrZXJuZWw6IFRlc3RpbmcgZHluYW1pYyBmdHJhY2Ugb3BzICMyOgo+ID4gTm92IDE1
IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6ICgxIDAgMSA1ODkgMCkKPiA+IE5vdiAxNSAwMzowNzox
MyBzdGFnZTQga2VybmVsOiAoMSAxIDIgNjM1IDApCj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0
IGtlcm5lbDogKDIgMSAzIDEgMikKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiAo
MiAyIDQgMTI1IDEyNikKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiAoMyAyIDQg
MTQ2MDAxIDE0NjA3OCkKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiAoMyAzIDUg
MTQ2MDM1IDE0NjExMikgUEFTU0VECj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDog
VGVzdGluZyBmdHJhY2UgcmVjdXJzaW9uOiBQQVNTRUQKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFn
ZTQga2VybmVsOiBUZXN0aW5nIGZ0cmFjZSByZWN1cnNpb24gc2FmZTogUEFTU0VECj4gPiBOb3Yg
MTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogVGVzdGluZyBmdHJhY2UgcmVnczogUEFTU0VECj4g
PiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogVGVzdGluZyB0cmFjZXIgbm9wOiBQQVNT
RUQKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiBUZXN0aW5nIHRyYWNlciBpcnFz
b2ZmOiBQQVNTRUQKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiBUZXN0aW5nIHRy
YWNlciB3YWtldXA6Cj4gPiBOb3YgMTUgMDM6MDc6MTMgc3RhZ2U0IGtlcm5lbDogc2NoZWQ6IERM
IHJlcGxlbmlzaCBsYWdnZWQgdG9vIG11Y2gKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2Vy
bmVsOiBQQVNTRUQKPiA+IE5vdiAxNSAwMzowNzoxMyBzdGFnZTQga2VybmVsOiBUZXN0aW5nIHRy
YWNlciB3YWtldXBfcnQ6IFBBU1NFRAo+ID4gTm92IDE1IDAzOjA3OjEzIHN0YWdlNCBrZXJuZWw6
IFRlc3RpbmcgdHJhY2VyIHdha2V1cF9kbDogUEFTU0VECj4gPiBOb3YgMTUgMDM6MDc6MTMgc3Rh
Z2U0IGtlcm5lbDogVGVzdGluZyB0cmFjZXIgZnVuY3Rpb25fZ3JhcGg6IFBBU1NFRAo+ID4gYGBg
Cj4gPgo+ID4gTm90ZSB0aGF0IHRoZSBjaGFuZ2VzIG9mIG1jb3VudC1keW4uUyBjb25mbGljdHMg
d2l0aCB0aGlzIHVubWVyZ2VkCj4gPiBjb21taXQgKHJpc2N2OiBlbnRyeTogY29uc29saWRhdGUg
Z2VuZXJhbCByZWdzIHNhdmluZy9yZXN0b3JpbmcpLgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyMjExMDMwNzUwNDcuMTYzNDkyMy0xNS1ndW9yZW5Aa2VybmVsLm9y
Zwo+ID4KPiA+IENoYW5nZXMgc2luY2UgdjI6Cj4gPiAtIGxpbmUgdXAgdGhlIGNvbW1lbnRzIFtB
bmRyZXddCj4gPiAtIHJlbmFtZSBTQVZFX0FMTCBhcyBTQVZFX0FCSV9SRUdTIFtHdW8gUmVuXQo+
ID4gLSBjb25zb2xpZGF0ZSB0aGUgbW9kaWZpY2F0aW9ucyBvZiBtY291bnQtZHluLlMgaW50byBv
bmUgcGF0Y2ggW0d1byBSZW5dCj4gPiAtIGFkYXB0IHRoaXMgc2VyaWVzIGJhc2VkIG9uIFtyaXNj
djogZnRyYWNlOiBGaXh1cCBmdHJhY2UgZGV0b3VyIGNvZGVdWzFdIFtHdW8gUmVuXQo+IFRlc3Rl
ZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4KPiBodHRwczovL2dpdGh1Yi5jb20v
Z3VvcmVuODMvbGludXgvdHJlZS9mdHJhY2VfZml4dXBfdjMKPgpUaGFua3MgZm9yIHlvdXIgdGVz
dHMuCgpBbmQgdGhlIFBSRVBBUkVfQVJHUyB5b3Ugc3VnZ2VzdGVkIGhhcyBiZWVuIGFkZGVkIGlu
IHRoZSB2NCB0aHJlYWQuCkhlcmUgaXMgdGhlIGxpbmsgZm9yIHlvdXIgY29udmVuaWVuY2UuCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIxMTIwMDg0MjMwLjkxMDE1Mi0x
LXN1YWdyZmlsbGV0QGdtYWlsLmNvbS8KCj4gPgo+ID4gWzFdOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDIyMDkyMTAzNDkxMC4zMTQyNDY1LTEtZ3VvcmVuQGtlcm5lbC5v
cmcvCj4gPiB2MiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIy
MTExNjAzMTMwNS4yODY2MzQtMS1zdWFncmZpbGxldEBnbWFpbC5jb20vCj4gPgo+ID4gQ2hhbmdl
cyBzaW5jZSB2MToKPiA+IC0gZml4IHRoZSBjaGVja3BhdGNoIHdhcm5pbmdzIGluIHBhdGNoIDEK
PiA+IHYxIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIxMTE1
MDYxNTI1LjExMjc1Ny0xLXN1YWdyZmlsbGV0QGdtYWlsLmNvbQo+ID4KPiA+IFNvbmcgU2h1YWkg
KDIpOgo+ID4gICByaXNjdi9mdHJhY2U6IGFkZCBmdHJhY2VfZ3JhcGhfZnVuYwo+ID4gICByaXNj
di9mdHJhY2U6IG1ha2UgZnRyYWNlX2NhbGxlciBjYWxsIGZ0cmFjZV9ncmFwaF9mdW5jCj4gPgo+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmggfCAgMTMgKystCj4gPiAgYXJjaC9y
aXNjdi9rZXJuZWwvZnRyYWNlLmMgICAgICB8ICAzMCArKystLS0tCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvbWNvdW50LWR5bi5TICB8IDE0MyArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTI5IGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygt
KQo+ID4KPiA+IC0tCj4gPiAyLjIwLjEKPiA+Cj4KPgo+IC0tCj4gQmVzdCBSZWdhcmRzCj4gIEd1
byBSZW4KVGhhbmtzLApTb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
