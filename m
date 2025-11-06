Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31426CCFA0D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 01:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29et3ZkGnjqPo5QvKlKlOuBD6u9qhnJKztq+fSHKU6Y=; b=PE1r5zPz+ineDS
	EcRt32R24TK8MsKWfs8hYog8HV7hL+JMfw883iehANQgf/LFHx829nP8fF4Z2wU6UocMXoc1TqEeC
	RwRotGbfH2c4vHfdlEluAHHnMat/C9oW/PAQudbKOVjBcJn57TsHb8+e3Tk0vRAg3jlAtUhmkxSlC
	LJMw59IXoAO2daZ5basjXI2WBTjpLdarvs3YE1rJf48r3NepwBB0x9jgKBHaFFKsm7UBK3PuyeE+h
	GjEdbK4TacXUfQaZ4Xw60Karac648NScV/HAsMdweqoYox9Ztt/0zaFfwepZRSQsxgu/7VeCBbIZa
	G5ArGhGS8obKQODcR6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoRP-0000000EgMe-2XrO;
	Thu, 06 Nov 2025 01:05:31 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoRL-0000000EgId-3GT8
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 01:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762391050;
	bh=vyp2Kx+dt44hfjvf5608tzCtPl9ysFpd/507p9pCYdE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Mf2rJUv3CtLPscJRcBnWuCaYJKFotilEBq6DKMQGHl949H/R+ht6DqDZiwsEMqU+G
	 GQ8TT/K9EfmDA9QEdUVZfg15wu1lSkx2ni3RRZh8tIjeNBA0Q8S3+aPU1tbGvGI2Sc
	 g8wFOg9rYwoI69jc0eLzNV3DljuXRzG1k8ujEypA=
X-QQ-mid: esmtpsz11t1762391034tcbbad8ae
X-QQ-Originating-IP: l788y3NbUzY9RphsrdxIwMifswNmTWK4vbzwWT5nAzU=
Received: from = ( [183.48.244.176])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Nov 2025 09:03:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14392221022385016133
EX-QQ-RecipientCnt: 13
Date: Thu, 6 Nov 2025 09:03:52 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <751C70A7BC663B0E+aQvz-ASa-z4fvGiO@kernel.org>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
 <aQvUgQvM48LsSzei@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQvUgQvM48LsSzei@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N349XWt0QhArpi25n9LXj75OyzuFPq2bXspqzSJUucSGydOOODDtmYxK
	hinXGhhyo8Rk99VXKPXY1vsMcMBVHUzmKi9eL+k/UAdkXYya9/jaLFibV3aB5/zYJoxa5Ni
	J7JykzddZK92gsl807/pZ0klJ7SXnVzeBNMmUSMb9XLqZRfy0Lb2i5rLBQEOijVdAomQ8+I
	cwv3EiE4udg8BNFhRD5ofYR6WUoE6JIZ99DbmHumm5exvEbRLQ9mbXdS/bWaRMd+L2zCxdl
	CfuYzvCeJ/3OCoeV9E4pQG0AbiWKgcfOfZBLqqbJsj3Eg9YHlplR4aEbDCfbdNmu93/Lw8W
	O7pVDur8ec41+eV8EwzU1/Sx2bFRSXrTsxHDnpZCseoEas/Gr4CmokfDAc39G/7Z1HpHJOm
	BKotiGyanWszbhWoy4tR1Jva1Kg7Dd77ERvO5G6GLULhwYgvrqJBKZVDkZiWty7Oyacc9j2
	gbHMjBJtd/HlH8HObimQobfQiTCK+4pW0UpSL1VluyoRR/2IJSaWRmZeMTzXr2w/ENhRlRQ
	ZrFjgIQt768S8eX/lWaAnaU+jefXzdcTJmviVHTGIhEZ6dzBb6Br1C7HjUwrBaiP7CCd10P
	WvdcgIVmfvsSsY9TJmciG3D/+5XX2R+Jrb020h4xPATB7wbGjkZ1kPKVgoh6cyYUaLBP6b/
	YmmjvTSRBJ4lKVC71PHfX/tmCYlscBd30QBDrmw9oY2CRdI91S+o/R0yK5rRGnxSubM5Id6
	HN2fnmUuMTgDSQKZSrhCwtGFGUxYPKeu8zryAS5RwwASJP/WGiWsTyWbCLwHbmoFe9k5vw1
	hxDHRN2g4jcX645abv0Jbe6l+b1u9DR9vuR82zGZp6LK52YKKVRBDS2vZNDXyWdEVmjwYzJ
	iX4biutDneqHyRHcjA9RvFFQ+6TjmuaP3MB2aAgNWA0dH20F4eW+Kqvp/8r1sIAwDWMA55B
	6Gcm9QLyHsCpjvG1NHA3LcYtev1fp7gLm2hNRWWjSuIylJPDj5hSMXTckNqq44a0iFfcceb
	DnSbfZ1GwGFP7V8vbIJFnNqCJ6jzfLDpjDMnGbIGC5i8Scxdbo/gSSJ27Sv5LH/JIc+NLz1
	8rBdE7WLwnRl3Pu5X/J46SfaiHsxSJvxIsKORZ5lT7xZe6azEzQyFf+Nt/fP4odH3Wy3LQD
	DM8s
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_170528_667491_2864D891 
X-CRM114-Status: GOOD (  21.68  )
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

T24gV2VkLCBOb3YgMDUsIDIwMjUgYXQgMTE6NDk6MzdQTSArMDEwMCwgQXVyZWxpZW4gSmFybm8g
d3JvdGU6Cj4gT24gMjAyNS0xMS0wNSAxNzo0MiwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+IE9u
IFdlZCwgTm92IDA1LCAyMDI1IGF0IDA5OjM0OjIxQU0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToK
PiA+ID4gT24gVHVlLCAwNCBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+ID4gCj4g
PiA+ID4gT24gTW9uLCBOb3YgMDMsIDIwMjUgYXQgMDE6NDg6MzNBTSArMDEwMCwgU2ViYXN0aWFu
IFJlaWNoZWwgd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUg
MDA6MDE6NTggKzAxMDAsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGlzIGFk
ZHMgcG93ZXJvZmYvcmVib290IHN1cHBvcnQgZm9yIHRoZSBTcGFjZW1pVCBQMSBQTUlDIGNoaXAs
IHdoaWNoIGlzCj4gPiA+ID4gPiA+IGNvbW1vbmx5IHBhaXJlZCB3aXRoIHRoZSBTcGFjZW1pVCBL
MSBTb0MuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBOb3RlOiBGb3IgcmVsaWFibGUgb3BlcmF0
aW9uLCB0aGlzIGRyaXZlciBkZXBlbmRzIG9uIGEgdGhpcyBwYXRjaCB0aGF0IGFkZHMKPiA+ID4g
PiA+ID4gYXRvbWljIHRyYW5zZmVyIHN1cHBvcnQgdG8gdGhlIFNwYWNlbWlUIEkyQyBjb250cm9s
bGVyIGRyaXZlcjoKPiA+ID4gPiA+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFjZW1p
dC8yMDI1MTAwOS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2QGxpbnV4LnNwYWNlbWl0
LmNvbS8KPiA+IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eCj4gPiBkZXBlbmRlbmN5IGlzIGhlcmUuCj4gCj4gT2ggaW5kZWVkLCBJIGhh
dmUgZm9yZ290dGVuIGFib3V0IHRoaXMgcGFydC4KPiAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
IFsuLi5dCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+ID4gPiA+IAo+
ID4gPiA+ID4gWzEvMl0gZHJpdmVyOiByZXNldDogc3BhY2VtaXQtcDE6IGFkZCBkcml2ZXIgZm9y
IHBvd2Vyb2ZmL3JlYm9vdAo+ID4gPiA+ID4gICAgICAgY29tbWl0OiAyODEyNGNjMGZiOGM3ZGMw
MWE2ODM0ZDIyNzM1MWUyNWQ5YTkyYzU4Cj4gPiA+ID4gU2hvdWxkIHdlIGFwcGx5IGl0IG5vdz8g
VGhlIGRlcGVuZGVuY3kgcGF0Y2ggaGFzbuKAmXQgYmVlbiBtZXJnZWQgeWV0Li4uCj4gPiA+IAo+
ID4gPiBXaGF0IGlzIHRoZSBkZXBlbmRlbmN5Pwo+ID4gSSBwb2ludCBpdCBvdXQgYWJvdmUuCj4g
PiBXaXRob3V0IHRoaXMgcGF0Y2gsIHJlYm9vdCBhbmQgc2h1dGRvd24gd291bGQgZW5kIHVwIGNh
bGxpbmcgdGhlIG5vbi1hdG9taWMgaTJjX3RyYW5zZmVyLgo+IAo+IE5vdGUgaG93ZXZlciB0aGlz
IGlzIG5vdCBhIHN0cm9uZyBkZXBlbmRlbmN5LCBpdCBpcyBuZWVkZWQgdG8gbWFrZSB0aGUgCj4g
cmVzZXQgb3IgcG93ZXIgb2ZmIHJlbGlhYmxlLiBDYWxsaW5nIG5vbi1hdG9taWMgaTJjX3RyYW5z
ZmVyIGxlYWQgdG8gYSAKPiBzdWNjZXNzZnVsIHJlc2V0IG9yIHBvd2VyIG9mZiBhIGJpdCBtb3Jl
IHRoYW4gaGFsZiBvZiB0aGUgdGltZS4KT2ggcmVhbGx5PyBJIG5ldmVyIGhhZCBzdWNjZXNzIHdp
dGggdGhlIG5vbi1hdG9taWMgdHJhbnNmZXIuCgpCdXQgaG93ZXZlciwgYXMgTGVlIHBvaW50ZWQg
b3V0LCB0aGlzIHBhdGNoIGRvZXNu4oCZdCBuZWVkIHRvIGRvCmFueXRoaW5nIHNwZWNpYWwgbm93
LgpXZSBvbmx5IG5lZWRzIHRvIGVuc3VyZSB0aGF0IHRoZSBNRkQgcGFydCB3b27igJl0IGJlIHBy
b2JlZC4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgLSBUcm95Cj4gCj4gUmVnYXJkcwo+IEF1
cmVsaWVuCj4gCj4gLS0gCj4gQXVyZWxpZW4gSmFybm8gICAgICAgICAgICAgICAgICAgICAgICAg
IEdQRzogNDA5NlIvMURERDhDOUIKPiBhdXJlbGllbkBhdXJlbDMyLm5ldCAgICAgICAgICAgICAg
ICAgICAgIGh0dHA6Ly9hdXJlbDMyLm5ldAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
