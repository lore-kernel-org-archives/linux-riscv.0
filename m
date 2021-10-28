Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3B6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C0560D07
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 17:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06C0560D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=36OF0BuOeaAuuAK+SDjx8PP9gt9hexYKgh+VepX1nik=; b=b4CdZ9b78H90124oWMjsIrNhGk
	jrTA7F88g0lmOx7FqfKzauG67p+6DuTyBQO7501XVeUEZsW6NDaAuheN9sYlTiT8oMz8Ap9oQY///
	KpbNEIZvz58tKmzln3J70z2l1y/p+Ss8wGY3PFfWxbaE8bseVQcQUhTgG1EruDnbZU7zHT3QLwPxL
	K/WMfF5Ka6QxlAo+nFUQCigTvdJ6N04hZucpFeSHh2BZ+pofMdwclhj+0lUYswCdtlHox1Si83Kpj
	IOZQXKSzAC8bAzp+L/ORtdzHq8QwGprbgdEP5shHt/1auyZtmWDmDnIc/m7ahtL5xVAcfdVn7+SKS
	v248yiDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg91J-008hpY-Oc; Thu, 28 Oct 2021 17:16:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg91F-008hns-UD
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 17:16:51 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so5703718pjd.1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 10:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Otd8wqbvX1Uw8nMu3+24uiRjK4m32qtFfunufxK5O1w=;
 b=yzm/DL9B4BfHqch51I3/f+IhIRl5OUPUa/iPXmZb9JNGqlmcnXvHT9wzcY80WC80X4
 JJXcXOjAT1LXvAy5pvy4cUsR2cFTnyRhPvHkbiSzpAJv2q211biot9xMRHO85OcsINFK
 uV6qfURruqRqTAMR/XI9X/+ymXniDK2ZEMtr6i7xJqNfdjcqs2j7AJB+DeRkd3PiV1Jw
 e5dr3yNkwlJVtlp8SZDkctdW6BWzfNo3oTwoBez7ehKJXETi7y+jyCiw1LDstFtTbIOQ
 zLmAXzrx5QFe9mCswZLNlYmurTyPKYJuFJshw+LvDlVlf1LZDtPTjJ4+UF7ySvuKsjcW
 HWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Otd8wqbvX1Uw8nMu3+24uiRjK4m32qtFfunufxK5O1w=;
 b=f3/fhg2Dc3EwylTZ3wJLhcb2vfRYNXNy7+eI9jfCGvWZs7M+359fOsgdNXGsqKF8xQ
 BLO9PE7hl22jhDPncbWSDIjCvr2DOZiPvCC8ORVPtmPVWPzCDO1xv5cxpjNuJ1m7iIWW
 asGAFoYdIMcANlY22Dk8/QnmtslYp9EFK5ZVO7DELQxDYTB1jl2PID6k8da4MDhpZgqe
 Hj8CgA4HajLvfRKPYgyWEr5k5bp3iCFuWlx80JbDOIEx1QJTijEbjdPmwLgIakyc0aCw
 Jo7p43g4W0x+1P+99ZGriXffN72GAelFSv1bWlxXJGTSNNHe2LNrTekfbaSdpLH8V6/v
 c99g==
X-Gm-Message-State: AOAM533xA6OPSLAOxjH44sCP3NjaP/qlwjDun6dvU1XvMq1HDIuvm4iP
 slN0FSk7h8K/qgH/XN4/+Fa8Cg==
X-Google-Smtp-Source: ABdhPJytfam8w3644kpAMsGPzZI1mS9HokpMKgKf1d/Qspc0dhNn6t1sdTh7eGTZ1cAZr7GuiiOu3g==
X-Received: by 2002:a17:90a:65c7:: with SMTP id
 i7mr14075110pjs.192.1635441408161; 
 Thu, 28 Oct 2021 10:16:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z15sm3260685pga.16.2021.10.28.10.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 10:16:47 -0700 (PDT)
Date: Thu, 28 Oct 2021 10:16:47 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Oct 2021 10:16:45 PDT (-0700)
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
In-Reply-To: <CAAhSdy2oV9fNtsY258h6zQS6Us7GyW6B_ox6U1Um2Why354-gA@mail.gmail.com>
CC: atishp@atishpatra.org, heiko@sntech.de, geert@linux-m68k.org, re@w6rz.net, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-730fea8d-0455-4333-a731-1e7b0e062587@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_101650_049608_E21999F7 
X-CRM114-Status: GOOD (  38.45  )
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

T24gVGh1LCAyOCBPY3QgMjAyMSAwOToyMTozMSBQRFQgKC0wNzAwKSwgYW51cEBicmFpbmZhdWx0
Lm9yZyB3cm90ZToKPiBPbiBUaHUsIE9jdCAyOCwgMjAyMSBhdCA4OjM5IFBNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIDI3IE9jdCAyMDIx
IDE2OjM0OjE1IFBEVCAoLTA3MDApLCBhdGlzaHBAYXRpc2hwYXRyYS5vcmcgd3JvdGU6Cj4+ID4g
T24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgMjozNCBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPj4gPj4KPj4gPj4gQW0gRGllbnN0YWcsIDI2LiBPa3RvYmVyIDIwMjEs
IDEwOjU3OjI2IENFU1Qgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46Cj4+ID4+ID4gSGkgSGVp
a28sCj4+ID4+ID4KPj4gPj4gPiBPbiBUdWUsIE9jdCAyNiwgMjAyMSBhdCAxMDo1MyBBTSBIZWlr
byBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPj4gPj4gPiA+IEFtIERpZW5zdGFn
LCAyNi4gT2t0b2JlciAyMDIxLCAwODo0NDozMSBDRVNUIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9l
dmVuOgo+PiA+PiA+ID4gPiBPbiBUdWUsIE9jdCAyNiwgMjAyMSBhdCAyOjM3IEFNIFJvbiBFY29u
b21vcyA8cmVAdzZyei5uZXQ+IHdyb3RlOgo+PiA+PiA+ID4gPiA+IE9uIDEwLzI1LzIxIDg6NTQg
QU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPj4gPj4gPiA+ID4gPiA+IFdoZW4gYm9vdGlu
ZyBhIGtlcm5lbCB3aXRoIENPTkZJR19OUl9DUFVTPTQgb24gTWljcm9jaGlwIFBvbGFyRmlyZSwK
Pj4gPj4gPiA+ID4gPiA+IHRoZSA0dGggQ1BVIGVpdGhlciBmYWlscyB0byBjb21lIG9ubGluZSwg
b3IgdGhlIHN5c3RlbSBjcmFzaGVzLgo+PiA+PiA+ID4gPiA+ID4KPj4gPj4gPiA+ID4gPiA+IFRo
aXMgaGFwcGVucyBiZWNhdXNlIFBvbGFyRmlyZSBoYXMgNSBDUFUgY29yZXM6IGhhcnQgMCBpcyBh
biBlNTEsCj4+ID4+ID4gPiA+ID4gPiBhbmQgaGFydHMgMS00IGFyZSB1NTRzLCB3aXRoIHRoZSBs
YXR0ZXIgYmVjb21pbmcgQ1BVcyAwLTMgaW4gTGludXg6Cj4+ID4+ID4gPiA+ID4gPiAgICAtIHVu
dXNlZCBjb3JlIGhhcyBoYXJ0aWQgMCAoc2lmaXZlLGU1MSksCj4+ID4+ID4gPiA+ID4gPiAgICAt
IHByb2Nlc3NvciAwIGhhcyBoYXJ0aWQgMSAoc2lmaXZlLHU3NC1tYyksCj4+ID4+ID4gPiA+ID4g
PiAgICAtIHByb2Nlc3NvciAxIGhhcyBoYXJ0aWQgMiAoc2lmaXZlLHU3NC1tYyksCj4+ID4+ID4g
PiA+ID4gPiAgICAtIHByb2Nlc3NvciAyIGhhcyBoYXJ0aWQgMyAoc2lmaXZlLHU3NC1tYyksCj4+
ID4+ID4gPiA+ID4gPiAgICAtIHByb2Nlc3NvciAzIGhhcyBoYXJ0aWQgNCAoc2lmaXZlLHU3NC1t
YykuCj4+ID4+ID4gPiA+ID4gPgo+PiA+PiA+ID4gPiA+ID4gSSBhc3N1bWUgdGhlIHNhbWUgaXNz
dWUgaXMgcHJlc2VudCBvbiB0aGUgU2lGaXZlIGZ1NTQwIGFuZCBmdTc0MAo+PiA+PiA+ID4gPiA+
ID4gU29DcywgYnV0IEkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhlc2UuICBUaGUgaXNzdWUgaXMg
bm90IHByZXNlbnQKPj4gPj4gPiA+ID4gPiA+IG9uIFN0YXJGaXZlIEpINzEwMCwgYXMgcHJvY2Vz
c29yIDAgaGFzIGhhcnRpZCAxLCBhbmQgcHJvY2Vzc29yIDEgaGFzCj4+ID4+ID4gPiA+ID4gPiBo
YXJ0aWQgMC4KPj4gPj4gPiA+ID4gPiA+Cj4+ID4+ID4gPiA+ID4gPiBhcmNoL3Jpc2N2L2tlcm5l
bC9jcHVfb3BzLmMgaGFzOgo+PiA+PiA+ID4gPiA+ID4KPj4gPj4gPiA+ID4gPiA+ICAgICAgdm9p
ZCAqX19jcHVfdXBfc3RhY2tfcG9pbnRlcltOUl9DUFVTXSBfX3NlY3Rpb24oIi5kYXRhIik7Cj4+
ID4+ID4gPiA+ID4gPiAgICAgIHZvaWQgKl9fY3B1X3VwX3Rhc2tfcG9pbnRlcltOUl9DUFVTXSBf
X3NlY3Rpb24oIi5kYXRhIik7Cj4+ID4+ID4gPiA+ID4gPgo+PiA+PiA+ID4gPiA+ID4gICAgICB2
b2lkIGNwdV91cGRhdGVfc2Vjb25kYXJ5X2Jvb3RkYXRhKHVuc2lnbmVkIGludCBjcHVpZCwKPj4g
Pj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRpZGxlKQo+PiA+PiA+ID4gPiA+ID4gICAgICB7Cj4+ID4+ID4gPiA+
ID4gPiAgICAgICAgICAgICAgaW50IGhhcnRpZCA9IGNwdWlkX3RvX2hhcnRpZF9tYXAoY3B1aWQp
Owo+PiA+PiA+ID4gPiA+ID4KPj4gPj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAvKiBNYWtlIHN1
cmUgdGlkbGUgaXMgdXBkYXRlZCAqLwo+PiA+PiA+ID4gPiA+ID4gICAgICAgICAgICAgIHNtcF9t
YigpOwo+PiA+PiA+ID4gPiA+ID4gICAgICAgICAgICAgIFdSSVRFX09OQ0UoX19jcHVfdXBfc3Rh
Y2tfcG9pbnRlcltoYXJ0aWRdLAo+PiA+PiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgdGFza19zdGFja19wYWdlKHRpZGxlKSArIFRIUkVBRF9TSVpFKTsKPj4gPj4gPiA+ID4gPiA+
ICAgICAgICAgICAgICBXUklURV9PTkNFKF9fY3B1X3VwX3Rhc2tfcG9pbnRlcltoYXJ0aWRdLCB0
aWRsZSk7Cj4+ID4+ID4gPiA+ID4gPgo+PiA+PiA+ID4gPiA+ID4gVGhlIGFib3ZlIHR3byB3cml0
ZXMgY2F1c2Ugb3V0LW9mLWJvdW5kIGFjY2Vzc2VzIGJleW9uZAo+PiA+PiA+ID4gPiA+ID4gX19j
cHVfdXBfe3N0YWNrLHBvaW50ZXJ9X3BvaW50ZXJbXSBpZiBoYXJ0aWQgPj0gQ09ORklHX05SX0NQ
VVMuCj4+ID4+ID4gPiA+ID4gPgo+PiA+PiA+ID4gPiA+ID4gICAgICB9Cj4+ID4+ID4KPj4gPj4g
PiA+ID4gaHR0cHM6Ly9yaXNjdi5vcmcvd3AtY29udGVudC91cGxvYWRzLzIwMTcvMDUvcmlzY3Yt
cHJpdmlsZWdlZC12MS4xMC5wZGYKPj4gPj4gPiA+ID4gc2F5czoKPj4gPj4gPiA+ID4KPj4gPj4g
PiA+ID4gICAgIEhhcnQgSURzIG1pZ2h0IG5vdCBuZWNlc3NhcmlseSBiZSBudW1iZXJlZCBjb250
aWd1b3VzbHkgaW4gYQo+PiA+PiA+ID4gPiAgICAgbXVsdGlwcm9jZXNzb3Igc3lzdGVtLCBidXQg
YXQgbGVhc3Qgb25lIGhhcnQgbXVzdCBoYXZlIGEgaGFydAo+PiA+PiA+ID4gPiAgICAgSUQgb2Yg
emVyby4KPj4gPj4gPiA+ID4KPj4gPj4gPiA+ID4gV2hpY2ggbWVhbnMgaW5kZXhpbmcgYXJyYXlz
IGJ5IGhhcnQgSUQgaXMgYSBuby1nbz8KPj4gPj4gPiA+Cj4+ID4+ID4gPiBJc24ndCB0aGF0IGFs
c28gc2ltaWxhciBvbiBhYXJjaDY0Pwo+PiA+PiA+ID4KPj4gPj4gPiA+IE9uIGEgcmszMzk5IHlv
dSBnZXQgMC0zIGFuZCAxMDAtMTAxIGFuZCB3aXRoIHRoZSBwYXJhZ3JhcGggYWJvdmUKPj4gPj4g
PiA+IHNvbWV0aGluZyBsaWtlIHRoaXMgY291bGQgdmVyeSB3ZWxsIGV4aXN0IG9uIHNvbWUgcmlz
Y3YgY3B1IHRvbyBJIGd1ZXNzLgo+PiA+PiA+Cj4+ID4+ID4gWWVzLCBpdCBsb29rcyBsaWtlIGhh
cnQgSURzIGFyZSBzaW1pbGFyIHRvIE1QSURScyBvbiBBUk0uCj4+ID4+Cj4+ID4+IGFuZCB0aGV5
IGhhdmUgdGhlIHNldF9jcHVfbG9naWNhbF9tYXAgY29uc3RydWN0IHRvIG1hcCBod2lkcwo+PiA+
PiB0byBhIGNvbnRpbnVvdXMgbGlzdCBvZiBjcHUtaWRzLgo+PiA+Pgo+PiA+PiBTbyB3aXRoIGhh
cnRpZHMgbm90IGJlaW5nIG5lY2Vzc2FyaWx5IGNvbnRpbnVvdXMgdGhpcyBsb29rcyBsaWtlCj4+
ID4+IHJpc2N2IHdvdWxkIG5lZWQgYSBzaW1pbGFyIG1lY2hhbmlzbS4KPj4gPj4KPj4gPgo+PiA+
IFJJU0MtViBhbHJlYWR5IGhhcyBhIHNpbWlsYXIgbWVjaGFuaXNtIGNwdWlkX3RvX2hhcnRpZF9t
YXAuIExvZ2ljYWwKPj4gPiBjcHUgaWRzIGFyZSBjb250aW51b3VzCj4+ID4gd2hpbGUgaGFydGlk
IGNhbiBiZSBzcGFyc2UuCj4+ID4KPj4gPiBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IF9fY3B1X3Vw
X3N0YWNrL3Rhc2tfcG9pbnRlciBhcmUgcGVyIGhhcnQgYnV0Cj4+ID4gYXJyYXkgc2l6ZSBkZXBl
bmRzIG9uIHRoZSBOUl9DUFVzCj4+ID4gd2hpY2ggcmVwcmVzZW50cyB0aGUgbG9naWNhbCBDUFUu
Cj4+ID4KPj4gPiBUaGF0J3Mgd2h5LCBoYXZpbmcgYSBtYXhpbXVtIG51bWJlciBvZiBoYXJ0aWRz
IGRlZmluZWQgaW4gY29uZmlnIHdpbGwKPj4gPiBiZSBoZWxwZnVsLgo+Pgo+PiBJIGRvbid0IHVu
ZGVyc3RhbmQgd2h5IHdlJ2QgaGF2ZSBib3RoOiBpZiB3ZSBjYW4ndCBmaW5kIGEgQ1BVIG51bWJl
ciBmb3IKPj4gYSBoYXJ0LCB0aGVuIGFsbCB3ZSBjYW4gZG8gaXMganVzdCBsZWF2ZSBpdCBvZmZs
aW5lLiAgV291bGRuJ3QgaXQgYmUKPj4gc2ltcGxlciB0byBqdXN0IHJlbHkgb24gTlJfQ1BVUz8g
IFdlJ2xsIG5lZWQgdG8gZml4IHRoZSBjcmFzaGVzIG9uCj4+IG92ZXJmbG93cyBlaXRoZXIgd2F5
LiwKPgo+IEZvciBIU00gb3BzLCB3ZSBjYW4gZWFzaWx5IGZpeCB0aGlzIGxpbWl0YXRpb24gYmVj
YXVzZSB0aGUgSEFSVAo+IHN0YXJ0IGNhbGwgaGFzIGFuIG9wYXF1ZSBwYXJhbWV0ZXIgd2hpY2gg
Y2FuIGJlIHVzZWQgdG8gc3BlY2lmeSBUUAo+IGFuZCBTUCBmb3IgdGhlIEhBUlQgYmVpbmcgYnJv
dWdodCB1cC4KPgo+IEZvciBzcGlud2FpdCBvcHMsIEkgZG9uJ3Qgc2VlIG11Y2ggdmFsdWUgaW4g
Zml4aW5nIHNwYXJzZSBoYXJ0aWQKPiBwcm9ibGVtcyBzbyBsZXQncyBkb2N1bWVudCB0aGlzIHBy
b2JsZW0gYW5kIGhhdmUgYXBwcm9wcmlhdGUKPiBjaGVja3MgaW4gc3BpbndhaXQgb3BzIGZvciBv
dXQtb2YtYm91bmQgYXJyYXkgY2hlY2tzLgoKU2VlbXMgcmVhc29uYWJsZS4gIFRoYXQncyB0aGUg
bGVnYWN5IG1ldGhvZCBhbnl3YXksIHNvIGhvcGVmdWxseSB2ZW5kb3JzIAp3aWxsIGhhdmUgbW92
ZWQgdG8gdGhlIG5ldyBzdHVmZiBieSB0aGUgdGltZSB3ZSBnZXQgc3VmZmljaWVudGx5IHNwYXJz
ZSAKaGFydCBJRHMgdGhhdCB0aGlzIG1hdHRlcnMuCgpXZSBzaG91bGQgZml4IHRoZSBjcmFzaGVz
LCB0aG91Z2guICBIYXBweSB0byB0YWtlIGEgcGF0Y2gsIG90aGVyd2lzZSAKSSdsbCB0aHJvdyBz
b21ldGhpbmcgdG9nZXRoZXIuCgo+Cj4gUmVnYXJkcywKPiBBbnVwCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
