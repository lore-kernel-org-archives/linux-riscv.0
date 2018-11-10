Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71454C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 15:50:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED141206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 15:50:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kl0MGnyB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uX8vh3A9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="iQqHPM+F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED141206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXbl5l/9SrtXNOdE70MnmlnzK0/3G/bc6WjGTb9BQ6g=; b=kl0MGnyB93OS/N
	zdTACdqtKms/UctsmyGz1/eYj0E7bxD/nkrGOlq6q1mIyh8tnLHSQpqaeIFYqPXx0k9O+OlgwlfJ2
	30MEJGbmBA/1pwTVr77n4iFEI5upRT9eWX4mM2QlTShoylbUuEmIptwF6MpNGelVw3mjZuBUPKkW2
	vSHeZSBEvvhycHRk4nvFjJ7RjOZ6jbHj4yo3dF0wdcxalbCyWRU1NV7JyPrJoHicyqx71zQQBIhUL
	N/4NwFX43qr5VlUVptnbjZONX/JuM3hyBF6rUH++zSg+Fg0mzOd2CavsklwCggtyY0P0DnUoAA5bS
	+xKJX0Gt7M+XRRqyVeCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLVWZ-0007qW-7M; Sat, 10 Nov 2018 15:50:15 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLVVp-0006Gy-7H
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 15:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IDtIyM+AqSN2veUZJ5iomADHVoRIe5Qy52lHTijg1I0=; b=uX8vh3A91RRx/CcKRNiX8XlhQB
 NppAt5MeH14WHxd3J47+svAs94/1NDszZqwXIm+Li1x/bgXPm2jBxLlnvjrdCG8UrduFUwEvSOXw9
 CfJ5ZrDseYEALC8Co2Fp7/fSf6j9RPDXfJPY2ZAb6p/BO3siecQvuAivBRrTaKotJkFUJMQbSoXR8
 BqEQ3at/0ZgDTwVVc/PnjdSjtN/M93ApgZnRTALXk5gO7uZTfHmGG0/rihaVtOew9Fspz5lQx//Z8
 pmsCsnr//lrGD5cPIFqhrzrVN/4QO3V2+PQpnT3iGB8kg8G13YSCoyaVHwCtESBE7aTkH6RcRxvD7
 zA8A7hkQ==;
Received: from lkcl.net ([217.147.94.29])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLVVl-00054s-EC
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 15:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=IDtIyM+AqSN2veUZJ5iomADHVoRIe5Qy52lHTijg1I0=; 
 b=iQqHPM+FMOjvKp2BBToObWCdcY+XRIHbKSGs5mZO290ze4hM5ed3tPXBak6PbxjhiS/x4xTBO3/ir0uovnhp1O6BXd2Ez7m+sQkNQOUvaJUYNOUE0gtpCk19w1NXCAHhf9tTEX5SPI1tGUgXB6W4uMR0vstMdCJba9huEFyobkM=;
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLVVL-00085H-0P
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 15:48:59 +0000
Received: by mail-lj1-f176.google.com with SMTP id g26-v6so4054352lja.10
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 07:48:38 -0800 (PST)
X-Gm-Message-State: AGRZ1gJ9crw0nqp0tjgBu7j9GL6U+QqT0jD12lp9vdW/3QBm576FiFUC
 +YQQYyarAh8QCd+xeTbGLreNqDFsS+7VQoigEaQ=
X-Google-Smtp-Source: AJdET5daSt7VaHowjJ4jqMNd2iaPCMWKxD0wiUrT5UdPW2ynmxgjhfbNGCGSrWNrwKz7f1+J29v39dc8+rahYDpUQbs=
X-Received: by 2002:a2e:8187:: with SMTP id e7-v6mr8212595ljg.50.1541864912491; 
 Sat, 10 Nov 2018 07:48:32 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
In-Reply-To: <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 15:48:19 +0000
X-Gmail-Original-Message-ID: <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
Message-ID:
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: mick@ics.forth.gr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_104925_671452_C474FBD7 
X-CRM114-Status: GOOD (  29.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, atish.patra@wdc.com, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110154819.SOwCurvjWiKopkmD-leCwoupInvgbPhYBH7y5xXGW7A@z>

LS0tCmNyb3dkLWZ1bmRlZCBlY28tY29uc2Npb3VzIGhhcmR3YXJlOiBodHRwczovL3d3dy5jcm93
ZHN1cHBseS5jb20vZW9tYTY4CgpPbiBTYXQsIE5vdiAxMCwgMjAxOCBhdCAzOjMxIFBNIE5pY2sg
S29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAxOC0x
MS0xMCAwNzoxMiwgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDOrc6zz4HOsc+IzrU6Cj4g
PiBPbiBTYXQsIE5vdiAxMCwgMjAxOCBhdCAyOjQyIEFNIEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRy
YUB3ZGMuY29tPgo+ID4gd3JvdGU6Cj4gPgo+ID4+ICMjIENvbmNsdXNpb24KPiA+PiBUaGlzIHBy
b3Bvc2FsIGlzIGZhciBmcm9tIHBlcmZlY3QgYW5kIGFic29sdXRlbHkgYW55IHN1Z2dlc3Rpb24g
aXMKPiA+PiB3ZWxjb21lLiBPYnZpb3VzbHksIHRoZXJlIGFyZSBtYW55IG90aGVyIGZ1bmN0aW9u
YWxpdGllcyB0aGF0IGNhbiBiZQo+ID4+IGFkZGVkIHRvIHRoaXMgcHJvcG9zYWwuIEhvd2V2ZXIs
IEkganVzdCB3YW50ZWQgdG8gc3RhcnQgd2l0aCBzb21ldGhpbmcKPiA+PiB0aGF0IGlzIGFuIGlu
Y3JlbWVudGFsIGNoYW5nZSBhdCBiZXN0IHRvIGtpY2sgb2ZmIHRoZSBkaXNjdXNzaW9uLiBUaGUK
PiA+PiBhaW0gaGVyZSBpcyB0byBpbml0aWF0ZSBhIGRpc2N1c3Npb24gdGhhdCBjYW4gbGVhZCB0
byBhIHJvYnVzdCBTQkkKPiA+PiBzcGVjaWZpY2F0aW9uLgo+ID4KPiA+ICB2ZXJ5IGNvb2wsIGF0
aXNoLgo+ID4KPiA+ICBpIHdvdWxkIHZlcnkgbXVjaCBsaWtlIHRvIHNlZSB0aGUgb3B0aW9uYWwg
YWRkaXRpb24gb2YgbXVsdGlwbGUKPiA+IHNlcmlhbCBsaW5lcywgYnkgYWRkaW5nIGEgZ2V0Y2hh
ciBhbmQgcHV0Y2hhciBmdW5jdGlvbiB0aGF0IHRha2VzIGp1c3QKPiA+IG9uZSBleHRyYSBhcmd1
bWVudDogdGhlIHNlcmlhbCBsaW5lIGluZGV4Lgo+ID4KPiA+ICB0aGVyZSBhcmUgYSBsb3Qgb2Yg
ZGlmZmVyZW50IHVzZXMgdG8gd2hpY2ggbXVsdC1zZXJpYWwgbGluZXMgbWF5IGJlCj4gPiBwdXQ6
Cj4gPgo+ID4gICogYm9vdCBtZXNzYWdlIHNlcGFyYXRpb24gZnJvbSBjb25zb2xlIGxvZ2luCj4g
PiAgKiBib290IG1hbmFnZW1lbnQgc2VwYXJhdGlvbiBmcm9tIG90aGVyIHB1cnBvc2VzICh1LWJv
b3QvY29yZWJvb3QpCj4gPiAgKiB2aXJ0dWFsIC9kZXYvdHR5UzAtMwo+ID4gICogY2xlYW4gVVBT
IHJlcG9ydGluZyBhbmQgbWFuYWdlbWVudAo+ID4gICogcmVtb3RlIHZpcnR1YWwgbWFjaGluZSBw
b3dlciBtYW5hZ2VtZW50IChwb3dlci1vbiAvIG9mZikKPiA+ICAqIHNpbXBsZSBib2ctc3RhbmRh
cmQgbXVsdGlwbGUgdmlydHVhbCBsb2dpbiBjb25zb2xlcwo+ID4gICogc2VwYXJhdGlvbiBvZiBk
ZWJ1ZyBtZXNzYWdlcyAoc3Rkb3V0L3N0ZGVycikgdG8gZWFzZSBkZWJ1Z2dpbmcgYW5kCj4gPiBk
ZXZlbG9wbWVudAo+ID4gICogcmVtb3RlIGFuZCB2aXJ0dWFsIE9wZW5PQ0QgYW5kIGtlcm5lbCBk
ZWJ1Z2dpbmcgd2l0aG91dCBkaXNydXB0aW5nCj4gPiB0aGUgbWFpbiBzZXJpYWwgY29uc29sZQo+
ID4gICogUFBQIHNlcmlhbCBsaW5rcy4KPiA+Cj4gPiB0aGlzIGxhdHRlciBpcyBvbmUgdGhhdCBp
IGFtIHBhcnRpY3VsYXJseSBpbnRlcmVzdGVkIGluLCBhcyBpIHdvdWxkCj4gPiBsaWtlIHRvIGJl
IGFibGUgdG8gYm9vdCBhIGZ1bGwgR05VL0xpbnV4IE9TIG9uIHNwaWtlLCBnaXZlbiB0aGUgbG93
ZXIKPiA+IGJhcnJpZXIgdG8gZW50cnkgaW4gbWFraW5nIG1vZGlmaWNhdGlvbnMgYW5kIGV4cGVy
aW1lbnRpbmcgd2l0aCBzcGlrZQo+ID4gdGhhbiBpdCBpcyB3aXRoIHFlbXUuCj4gPgo+ID4gIGlm
IHNwaWtlIHdlcmUgYWJsZSwgdGhyb3VnaCBhIG11bHRpLXNlcmlhbCBTQkkgaW50ZXJmYWNlLCB0
byBoYXZlIGEKPiA+IFBQUCBzZXJpYWwgbGluZSwgaXQgd291bGQgYmUgcG9zc2libGUgdG8gcnVu
IGEgcm9vdCBORlMgKG9yIG90aGVyCj4gPiBuZXR3b3JrIGJsb2NrIGRldmljZSkgd2l0aG91dCBo
YXZpbmcgdG8gc2FjcmlmaWNlIGNvbnNvbGUgYWNjZXNzLiAgaXQKPiA+IHdvdWxkIGJlIHBvc3Np
YmxlIHRvIGNyZWF0ZSBhbiBpbml0cmFtZnMgZnJvbSBhIGxvd2VyLWNhcGFiaWxpdHkKPiA+IHN5
c3RlbSBsaWtlIGJ1aWxkcm9vdCwgY29udGFpbmluZyBQUFAsIGVuYWJsZSBpdCwgYW5kIHBpdm90
LXJvb3Qgb3V0Cj4gPiB0byBhIGZ1bGwgc3RvY2sgR05VL0xpbnV4IE9TIHN1Y2ggYXMgZGViaWFu
IG9yIGZlZG9yYS4KPiA+Cj4gPiAgc28gdGhlcmUgYXJlIGh1Z2UgYmVuZWZpdHMsIHJlZHVjaW5n
IHRoZSBkZXZlbG9wbWVudCBiYXJyaWVyIHRvIGVudHJ5Cj4gPiBpbnRvIFJJU0MtViBleHBlcmlt
ZW50YXRpb24gYW5kIGRlYnVnZ2luZywgYW5kIG9wZW5pbmcgdXAgYSBtdWNoIHdpZGVyCj4gPiBy
YW5nZSBvZiBjYXBhYmlsaXRpZXMgYW5kIHBvc3NpYmlsaXRpZXMgZm9yIG1hY2hpbmUgYW5kIHZp
cnR1YWwgc3lzdGVtCj4gPiBtYW5hZ2VtZW50Lgo+ID4KPiA+IGwuCj4KPgo+IFRoZSBjdXJyZW50
IFNCSSBzYXlzIHRoYXQgY29uc29sZV9nZXRjaGFyL2NvbnNvbGVfcHV0Y2hhciBhcmUgZm9yIHRo
ZQo+IGRlYnVnCj4gY29uc29sZSBidXQgb24gTGludXggd2UgdXNlIHRoZW0gZm9yIHRoZSBtYWlu
IGNvbnNvbGUgb24gZWFybHlwcmludGsuCgogLi4uIHllYWggZXhhY3RseS4gIGFuZCB3aGF0IGlm
IHNvbWV0aGluZyBnb2VzIHdyb25nLCB5b3Ugd2FudCB0byBiZQphYmxlIHRvIGludGVyYWN0IG92
ZXIgb3Blbm9jZCB3aXRob3V0IGludGVyZmVyaW5nIHdpdGggdGhhdAplYXJseXByaW50aywgcGFy
dGljdWxhcmx5IGR1cmluZyB0aGF0IGNyaXRpY2FsIGZpcnN0IGJyaW5ndXAgcGhhc2Ugb2YKcmVh
bC13b3JsZCBzaWxpY29uPwoKPiBJCj4gdGhpbmsgaXQncyBtaXNsZWFkaW5nIGFuZCB3ZSBzaG91
bGQgYXQgbGVhc3QgaGF2ZSBhbiBhcmd1bWVudCB0byBjaG9zZQo+IGJldHdlZW4gdGhlIG1haW4g
Y29uc29sZSBhbmQgYW4gb3B0aW9uYWwgZGVidWcgY29uc29sZSwgb3IgcmVuYW1lCj4gdGhlbSB0
byBkZWJ1Z19jb25zb2xlX2dldGNoYXIvZGVidWdfY29uc29sZV9wdXRjaGFyIGFuZAo+IG1haW5f
Y29uc29sZV9nZXRjaGFyLwo+IG1haW5fY29uc29sZV9wdXRjaGFyLgoKIGkgaW5pdGlhbGx5IHRo
b3VnaHQgb2YgcHJvcG9zaW5nIHRoYXQsIGhvd2V2ZXI6CgogKDEpIHRoZSBBUEkgYWxyZWFkeSBl
eGlzdHMgd2l0aCAic2luZ2xlIGNvbnNvbGUiLiBpdCB3b3VsZCB0aGVyZWZvcmUKYmUgZGlzcnVw
dGl2ZSB0byBjaGFuZ2UgdGhhdAoKICgyKSBpZiBhZGRpbmcgc29tZXRoaW5nIGNhbGxlZCBkZWJ1
Z19jb25zb2xlX3tnZXQvcHV0fWNoYXIsIGl0IG1pZ2h0CmFzIHdlbGwgdGFrZSBhZHZhbnRhZ2Ug
b2YgdGhlIG9wcG9ydHVuaXR5IHRvIGJlIGV4dGVuZGVkIGFuZCBtYWRlCmdlbmVyaWMsIGFuZCBo
YXZlIHRoZSBleHRyYSBhcmd1bWVudCBhZGRlZAoKPiBIb3dldmVyIEkgZG9uJ3QgdGhpbmsgdGhh
dCBhcmd1bWVudCBzaG91bGQgYmUgdGhlIHNlcmlhbCBsaW5lLiBEaWZmZXJlbnQKPiB2ZW5kb3Jz
IG1heSB1c2UgZGlmZmVyZW50IHNlcmlhbCBsaW5lcyBmb3IgdGhlIG1haW4gY29uc29sZSAvIGRl
YnVnCj4gY29uc29sZSwKPiB0aGUgY2FsbGVyIGRvZXNuJ3Qga25vdyB3aGljaCBzZXJpYWwgbGlu
ZSBtYXBzIHRvIHdoaWNoIGNvbnNvbGUsIHNvIHRoZQo+IFNCSQo+IHNob3VsZCBiZSBtb3JlIGFi
c3RyYWN0IGFuZCB1c2Ugc29tZXRoaW5nIGxpa2UgYSBjb25zb2xlIGlkIHdoZXJlIGUuZy4gMAo+
IGlzCj4gbWFpbiBjb25zb2xlIGFuIDEgaXMgZGVidWcuCgogeWVzLCBpdCBzaG91bGQgW2hhdmVd
OiBteSBmZWVsaW5nIGlzLCBpdCdzIGEgbGl0dGxlIGxhdGUgaW4gdGhlIGdhbWUKZ2l2ZW4gdGhh
dCBpdCdzIGFsbW9zdCBjZXJ0YWlubHkgYmFrZWQgaW50byBwcmUtZXhpc3RpbmcgaGFyZHdhcmUs
IGJ5Cm5vdywgc28gdGhlIG5leHQgYmVzdCB0aGluZyBpcyBhIG5ldyBmdW5jdGlvbiBjYWxsLgoK
bC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
