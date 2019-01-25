Return-Path: <SRS0=IGe1=QB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5C0C282C0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 19:02:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C35E218B0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Jan 2019 19:02:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ppLm81x+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FO2wh0vF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C35E218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=D6Si4LwhiMZOI9r4/s9nRkGakYVdZ0O9Y4MZl4TH6CE=; b=ppLm81x+sgpcuBaYdj2D6Ui8G
	H2c8l2pt5LAkqSI86pI5pD1d4XTsQ6nfY04HxQ/XgQkEDGvQITf/Ry6lkUVENtmO5aqykC2zektwm
	DWTLiSZbR0BfzGpgiOHZDga+aLbtAX+Nsmm+Xim71+O2bcucLpyyyDmlyg224zh6XkFDLUC92nFp3
	lbzZIWAV/UlAlg+bAFG9xqkKHFTVDqNp9EGqmmGL3Nbm328fnvLYRWR9BJ3Qkd9OwjI6Aq3MQdB+r
	2+UoFsR7zQCOr+wArM3PdBoYKa6Vv5+P3i66bV1kSikveQ8l1zyyeaNwf3/4PeWuW4Dim0+QqMpLC
	51a508THw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gn6jx-0004OE-5b; Fri, 25 Jan 2019 19:02:09 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gn6jt-0004Mz-Ne
 for linux-riscv@lists.infradead.org; Fri, 25 Jan 2019 19:02:07 +0000
Received: by mail-pl1-x643.google.com with SMTP id t13so4943454ply.13
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jan 2019 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+gNsjMty4+NnX4KJE2TASNpDaKslYckTzSCUo/A5E2c=;
 b=FO2wh0vFVqrT8n7Oh0u09fKifxKR4owkwY2+uFsJwtT7+hku37LPOBjUVbkyl5rBWK
 V82ghp2magITJg2qM/kMex5JEiFtS2nRifk+XZaQRz0xlk9erz5JlFV0SuOqlFrDc0Z4
 w0rshdNTXGwBQJLvYwPqDzBocGneJjOXAUP6SpQj3sRfrHgzgsISqAQ/CPPmBD7inG1n
 xGcifATWXyFUWIDoICCUp2ezBs1VzPS/RS06nmnUGE2oE5GSKgVjEeYNF/eGoZYCGQec
 koHleBWooO77nafc2Qf3ZaEWs0dqOXeGPYe7mq3XoqP8y4fQKKjWcUrqOpub2tFowLtR
 WoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+gNsjMty4+NnX4KJE2TASNpDaKslYckTzSCUo/A5E2c=;
 b=f/BBTceT4LixSC3581UJT6CgG/aol0gT1ddUzYI+NhIxZ8X8digTver73ynU+J619B
 N6q2E2PG9VQfc6fwCriQXAq0goBIZX+S+FqmhIzGvb9Hg0qGLJFOEuSv1sK36pDyhn0y
 Wvfh2adL9WGu6XCSY7mOUfS0lcFo9k2hgU5GVfddlFJbZ4enayuSRbCUAY5rKB1TVYnO
 CkdCE4baYtOIKz15xgdZ9VJKweBcajWTsMhNtDr/FMPxo0oZtUsD8LVQrCLuPOm5aTEN
 Gz/Es+9Wuabl3uiXNiFHE0g7Ecu1deh+mIIQiApopApk9MUB3nHJ/aPlYg+GSdKZtg1t
 2x7Q==
X-Gm-Message-State: AJcUukcKaXUpJVmDSVjnGWA6UdZNTafiiMvl7TkIdEK1Lw9U/dY07MuR
 oKWtJt58pH7y2fyxt6XX3hn7bjz0ULM=
X-Google-Smtp-Source: ALg8bN7s8sltODOH4z34wdbWP4SUBk5D3rQA17csB4JRK7lqcarqnkR8zHXZ33MolZjBAlGz8ACBow==
X-Received: by 2002:a17:902:20c6:: with SMTP id
 v6mr12310793plg.156.1548442924731; 
 Fri, 25 Jan 2019 11:02:04 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w10sm28855005pgi.81.2019.01.25.11.02.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Jan 2019 11:02:03 -0800 (PST)
Date: Fri, 25 Jan 2019 11:02:03 -0800 (PST)
X-Google-Original-Date: Fri, 25 Jan 2019 10:58:41 PST (-0800)
Subject: Re: [RFC PATCH 0/3] RV64G eBPF JIT
In-Reply-To: <CAJ+HfNhHUCM_YPUF01s=Tgh-M1_PMF6Jev1PQjwqfgva0vgeLw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bjorn.topel@gmail.com
Message-ID: <mhng-954111da-46e1-4ace-83a9-9045cb2e69dd@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190125_110205_769180_9F53939D 
X-CRM114-Status: GOOD (  20.83  )
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
Cc: Christoph Hellwig <hch@infradead.org>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, daniel@iogearbox.net, davidlee@sifive.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxNSBKYW4gMjAxOSAwODowMzoxOCBQU1QgKC0wODAwKSwgYmpvcm4udG9wZWxAZ21h
aWwuY29tIHdyb3RlOgo+IERlbiB0aXMgMTUgamFuLiAyMDE5IGtsIDE2OjQwIHNrcmV2IENocmlz
dG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz46Cj4+Cj4+IEhpIEJqw7ZybiwKPj4KPj4g
YXQgbGVhc3QgZm9yIG1lIHBhdGNoIDMgZGlkbid0IG1ha2UgaXQgdG8gdGhlIGxpc3QuCj4+Cj4K
PiBIbW0sIGhlbGQgYmFjazogIllvdXIgbWVzc2FnZSB0byBsaW51eC1yaXNjdiBhd2FpdHMgbW9k
ZXJhdG9yCj4gYXBwcm92YWwiLiBFeGNlZWRlZCB0aGUgNDBrIGxpbWl0Lgo+Cj4gSSdsbCB3YWl0
IHVudGlsIHRoZSBtb2RlcmF0b3Igd2FrZXMgdXAgKFBhbG1lcj8pLgoKU29ycnksIGl0IHRvb2sg
bWUgYSB3aGlsZSB0byB3YWtlIHVwIDopCgo+Cj4KPiBCasO2cm4KPgo+PiBPbiBUdWUsIEphbiAx
NSwgMjAxOSBhdCAwOTozNToxNUFNICswMTAwLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+PiA+IEhp
IQo+PiA+Cj4+ID4gSSd2ZSBiZWVuIGhhY2tpbmcgb24gYSBSVjY0RyBlQlBGIEpJVCBjb21waWxl
ciwgYW5kIHdvdWxkIGxpa2Ugc29tZQo+PiA+IGZlZWRiYWNrLgo+PiA+Cj4+ID4gQ29kZXdpc2Us
IGl0IG5lZWRzIHNvbWUgcmVmYWN0b3JpbmcuIEN1cnJlbnRseSB0aGVyZSdzIGEgYml0IHRvbyBt
dWNoCj4+ID4gY29weS1hbmQtcGFzdGUgZ29pbmcgb24sIGFuZCBJIGtub3cgc29tZSBwbGFjZXMg
d2hlcmUgSSBjb3VsZCBvcHRpbWl6ZQo+PiA+IHRoZSBjb2RlIGdlbmVyYXRpb24gYSBiaXQgKG1v
c3RseSBCUEZfSyB0eXBlIG9mIGluc3RydWN0aW9ucywgZGVhbGluZwo+PiA+IHdpdGggaW1tZWRp
YXRlcykuCj4+ID4KPj4gPiBGcm9tIGEgZmVhdHVyZXMgcGVyc3BlY3RpdmUsIHR3byB0aGluZ3Mg
YXJlIG1pc3Npbmc6Cj4+ID4KPj4gPiAqIHRhaWwgY2FsbHMKPj4gPiAqICJmYXItYnJhbmNoZXMi
LCBpLmUuIGNvbmRpdGlvbmFsIGJyYW5jaGVzIHRoYXQgcmVhY2ggYmV5b25kIDEzYi4KPj4gPgo+
PiA+IFRoZSB0ZXN0X2JwZi5rbyAob25seSB0ZXN0ZWQgb24gNC4yMCEpIHBhc3NlcyBhbGwgdGVz
dHMuCj4+ID4KPj4gPiBJJ3ZlIGRvbmUgYWxsIHRoZSB0ZXN0cyBvbiBRRU1VICh2ZXJzaW9uIDMu
MS41MCksIHNvIG5vIHJlYWwgaGFyZHdhcmUuCj4+ID4KPj4gPiBTb21lIHF1ZXN0aW9ucy9vYnNl
cnZhdGlvbnM6Cj4+ID4KPj4gPiAqIEkndmUgYWRkZWQgIkhBVkVfRUZGSUNJRU5UX1VOQUxJR05F
RF9BQ0NFU1MiIHRvCj4+ID4gICBhcmNoL3Jpc2N2L0tjb25maWcuIElzIHRoaXMgYXNzdW1wdGlv
biBjb3JyZWN0Pwo+PiA+Cj4+ID4gKiBlbWl0X2ltbSgpIGp1c3QgcmVsaWVzIG9uIGx1aSwgYWRk
cyBhbmQgc2hpZnRzLiBObyBmYW5jeSB4b3JpIGNvc3QKPj4gPiAgIG9wdGltaXphdGlvbnMgbGlr
ZSBHQ0MgZG9lcy4KPj4gPgo+PiA+ICogU3VnZ2VzdGlvbnMgb24gaG93IHRvIGltcGxlbWVudCB0
aGUgdGFpbCBjYWxsLCBnaXZlbiB0aGF0IHRoZQo+PiA+ICAgcHJvbG9ndWUvZXBpbG9ndWUgaGFz
IHZhcmlhYmxlIHNpemUuIEkgd2lsbCBkaWcgaW50byB0aGUgZGV0YWlscyBvZgo+PiA+ICAgbWlw
cy9hcm02NC94ODYuIDotKQo+PiA+Cj4+ID4gTmV4dCBzdGVwcyAocHJpb3IgcGF0Y2ggcHJvcGVy
KSBpcyBjbGVhbmluZyB1cCB0aGUgY29kZSwgYWRkIHRhaWwKPj4gPiBjYWxscywgYW5kIG1ha2lu
ZyBzdXJlIHRoYXQgYnBmdG9vbCBkaXNhc3NlbWJseSB3b3JrcyBjb3JyZWN0bHkuCj4+ID4KPj4g
PiBBbGwgaW5wdXQgYXJlIHdlbGNvbWUuIFRoaXMgaXMgbXkgZmlyc3QgUklTQy1WIGhhY2ssIHNv
IEkgc3VyZSB0aGVyZQo+PiA+IGFyZSBhIGxvdCB0aGluZ3MgdG8gaW1wcm92ZSEKPj4gPgo+PiA+
Cj4+ID4gVGhhbmtzLAo+PiA+IEJqw7Zybgo+PiA+Cj4+ID4KPj4gPiBCasO2cm4gVMO2cGVsICgz
KToKPj4gPiAgIHJpc2N2OiBzZXQgSEFWRV9FRkZJQ0lFTlRfVU5BTElHTkVEX0FDQ0VTUwo+PiA+
ICAgcmlzY3Y6IGFkZCBidWlsZCBpbmZyYSBmb3IgSklUIGNvbXBpbGVyCj4+ID4gICBicGYsIHJp
c2N2OiBhZGRlZCBlQlBGIEpJVCBmb3IgUlY2NEcKPj4gPgo+PiA+ICBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICB8ICAgIDIgKwo+PiA+ICBhcmNoL3Jpc2N2L01ha2VmaWxlICAgICAgICAg
ICB8ICAgIDQgKwo+PiA+ICBhcmNoL3Jpc2N2L25ldC9NYWtlZmlsZSAgICAgICB8ICAgIDUgKwo+
PiA+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXAuYyB8IDE2MTIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTYyMyBpbnNlcnRpb25z
KCspCj4+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L25ldC9NYWtlZmlsZQo+PiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wLmMKPj4gPgo+
PiA+IC0tCj4+ID4gMi4xOS4xCj4+ID4KPj4gPgo+PiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+
ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiA+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4gLS0tZW5kIHF1b3RlZCB0
ZXh0LS0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
