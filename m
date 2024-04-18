Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF19C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 16:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZNCF5osM0szrMj/s16ROnjEPaNH7JEmdB1XkphktpQ=; b=07/14TulZ6adj0
	0QnZlNRQEsmgXTBMUD7m/V4qpE+ptZv+zJXFlfbLycFG82jKRBlfrGMjW2tKlgVfBG0npXlhZ9AAO
	cpfNZw/QIzJ7AThJFIyIcB4teuL0RPJG/IVMdxpoRsPOoXMRUtR7CtW1i8jcuiWZj1YzeikEGmDrB
	OQsnbMjDqCQVV5+M7+AoFNb0Yd2TcF2UOgoJlvtYNoQAbuu8VsEhnfS13IWEhCdtdUits0U2Id+R3
	35/M3ciqgesGKSCDqA/Gw6KzQLgQRPPq2boayHg4sw80HbPDkXyxH2gsoAk9T5h+o99njlT3+q6Yn
	ZZzn2a1kGGQnPbAO7OJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUNm-00000002y3Y-2TjE;
	Thu, 18 Apr 2024 16:13:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUNj-00000002y23-0eGn
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 16:13:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5dbf7b74402so578518a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713456780; x=1714061580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WYegnjNIT6ITUxIPv0/Q8MWBXWcokuDnEdLFw52f4Y=;
        b=LvxFVbesehQOM/Pu8moo0/S/pp1TZw9ylhrOSsdAEhwuzuY8oGrQKA+MkMMS+OVQwC
         gsfdwg597xtEk4Tlwf+s6LeGLSv8dZDAmbdn4OS+INbfRi0rJFOwR12KDWqeuk384gR6
         rWY3cvy5iTjFNIkW5FM0T+zOEfj5G3vLPlRsLJncovZRwhKdMGyR/NRsxH3yO3V8q908
         s3+gxw1psDejqIWvh7GS3Ljgg7PqCj8Wjswpw5q2wXJiOuOaj7Sw7s7NhTXA1H5+vgSm
         S/IO/uyYI048UPIgXeQhQimAV331uvpL/1oL3v1+no9xbFkxq26OQhSdxlBaGi4d/znd
         JmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713456780; x=1714061580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WYegnjNIT6ITUxIPv0/Q8MWBXWcokuDnEdLFw52f4Y=;
        b=BZ81U/GDgAvmgG+5iJUSbvNWNHiF4zS6wayKazpTTjpooTIDM/NDkXMsg3li3NtA4A
         tFJlj+pZf18ETsmkyrqz3O0iZamEehcknDkHgPC325faslG8LiyWHmuSNYL1NRNhJIl0
         QglDFWYx43dlwaqpxVWXPxX1yMHhMsVdLjgbIaXl0MukXur89Xe6rWlJ364Mmy7iks6p
         wJxgxrz/FyoWuorMhpBjtr4F2Mi1KH5QFmx9idmLCCvPr1KYr+dNCYZ9PVV/+S4jVCNy
         GSw8gEu1SVv2vH43mDBxZttlckBFQAHQ8HWoFqbGVqtABKhnDH33Xv63AYTjPPQABnOg
         dd6g==
X-Forwarded-Encrypted: i=1; AJvYcCVsuEmSmgrW0ycpKPrWsp1oEkCIVK7b9V5DZJZ+lKNc+iAL2ZpuyR4hJSVQiXldTzRk9DvWLZ4VmSnDZByDfKInCJVfnBIKkN9QvmyW3GcF
X-Gm-Message-State: AOJu0Yy8wNzPoQbBSu9GNtSEwAJIAxQ9hgOhV8gJcQaT6hUFFXCGpln0
	HGs1c7Gtcrpff93czOxsgrMNi40dYT0cdT1xZg/I5UQMkq+LpxOkSaPauCtLiUf9pWgDhJiF2Pi
	Lxp6xHJqMW+i9bEiFH5JdPze2OgFhi2PmtkafgQ==
X-Google-Smtp-Source: AGHT+IE540tIbatlzBLLRdYDFdE/gaEn76X4nIZPEK27zBxxh80jC+Hni9udU6puJgxg5fEqmSDfdWteIZhb/AFmz3M=
X-Received: by 2002:a17:90b:4c92:b0:2a5:395e:8673 with SMTP id
 my18-20020a17090b4c9200b002a5395e8673mr3284250pjb.5.1713456779903; Thu, 18
 Apr 2024 09:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
 <20240418114942.52770-2-luxu.kernel@bytedance.com> <20240418-dove-deferral-2b01100e13ca@spud>
In-Reply-To: <20240418-dove-deferral-2b01100e13ca@spud>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Apr 2024 00:14:47 +0800
Message-ID: <CAPYmKFsddST1n2ZU+5=c_yPqAKTjQ4X1mKVFMZbhfo8xiB+OTA@mail.gmail.com>
Subject: Re: [External] Re: [RFC 1/2] riscv: process: Introduce idle thread
 using Zawrs extension
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	andy.chiu@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lihangjing@bytedance.com, 
	dengliang.1214@bytedance.com, xieyongji@bytedance.com, 
	chaiwen.cc@bytedance.com, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_091303_550059_8F61E4BC 
X-CRM114-Status: GOOD (  32.92  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTE6MDbigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gKyBEcmV3LAo+Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQg
MDc6NDk6NDFQTSArMDgwMCwgWHUgTHUgd3JvdGU6Cj4gPiBUaGUgWmF3cnMgZXh0ZW5zaW9uIGlu
dHJvZHVjZXMgYSBuZXcgaW5zdHJ1Y3Rpb24gV1JTLk5UTywgd2hpY2ggd2lsbAo+ID4gcmVnaXN0
ZXIgYSByZXNlcnZhdGlvbiBzZXQgYW5kIGNhdXNlcyB0aGUgaGFydCB0byB0ZW1wb3JhcmlseSBz
dGFsbAo+ID4gZXhlY3V0aW9uIGluIGEgbG93LXBvd2VyIHN0YXRlIHVudGlsIGEgc3RvcmUgb2Nj
dXJzIHRvIHRoZSByZXNlcnZhdGlvbgo+ID4gc2V0IG9yIGFuIGludGVycnVwdCBpcyBvYnNlcnZl
ZC4KPiA+Cj4gPiBUaGlzIGNvbW1pdCBpbXBsZW1lbnRzIG5ldyB2ZXJzaW9uIG9mIGlkbGUgdGhy
ZWFkIGZvciBSSVNDLVYgdmlhIFphd3JzCj4gPiBleHRlbnNpb24uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTog
SGFuZ2ppbmcgTGkgPGxpaGFuZ2ppbmdAYnl0ZWRhbmNlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBM
aWFuZyBEZW5nIDxkZW5nbGlhbmcuMTIxNEBieXRlZGFuY2UuY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IFdlbiBDaGFpIDxjaGFpd2VuLmNjQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jp
c2N2L0tjb25maWcgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKysrKysKPiA+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWlkbGUuaCAgIHwgMTEgKy0tLS0tLS0KPiA+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgIHwgIDEgKwo+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcHJvY2Vzc29yLmggfCAxNyArKysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1LmMgICAgICAgICAgICB8ICA1ICsrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMgICAgIHwgIDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAg
ICAgICAgfCA0MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICA3IGZpbGVzIGNo
YW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGJl
MDljODgzNmQ1Ni4uYTBkMzQ0ZTk4MDNmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29u
ZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC0xOSw2ICsxOSw3IEBAIGNv
bmZpZyBSSVNDVgo+ID4gICAgICAgc2VsZWN0IEFSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0sg
aWYgUEdUQUJMRV9MRVZFTFMgPiAyCj4gPiAgICAgICBzZWxlY3QgQVJDSF9FTkFCTEVfVEhQX01J
R1JBVElPTiBpZiBUUkFOU1BBUkVOVF9IVUdFUEFHRQo+ID4gICAgICAgc2VsZWN0IEFSQ0hfSEFT
X0JJTkZNVF9GTEFUCj4gPiArICAgICBzZWxlY3QgQVJDSF9IQVNfQ1BVX0ZJTkFMSVpFX0lOSVQK
PiA+ICAgICAgIHNlbGVjdCBBUkNIX0hBU19DVVJSRU5UX1NUQUNLX1BPSU5URVIKPiA+ICAgICAg
IHNlbGVjdCBBUkNIX0hBU19ERUJVR19WSVJUVUFMIGlmIE1NVQo+ID4gICAgICAgc2VsZWN0IEFS
Q0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUKPiA+IEBAIC01MjUsNiArNTI2LDIwIEBAIGNvbmZpZyBS
SVNDVl9JU0FfU1ZQQk1UCj4gPgo+ID4gICAgICAgICAgSWYgeW91IGRvbid0IGtub3cgd2hhdCB0
byBkbyBoZXJlLCBzYXkgWS4KPiA+Cj4gPiArY29uZmlnIFJJU0NWX0lTQV9aQVdSUwo+ID4gKyAg
ICAgYm9vbCAiWmF3cnMgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIHdhaXQtb24tcmVzZXJ2YXRpb24t
c2V0IGluc3RydWN0aW9ucyIKPiA+ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUK
PiA+ICsgICAgIGRlZmF1bHQgeQo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICAgQWRkcyBzdXBw
b3J0IHRvIGR5bmFtaWNhbGx5IGRldGVjdCB0aGUgcHJlc2VuY2Ugb2YgdGhlIFphd3JzCj4gPiAr
ICAgICAgICBleHRlbnNpb24gYW5kIGVuYWJsZSBpdHMgdXNhZ2UuCj4KPiBEcmV3LCBjb3VsZCB5
b3UsIGluIHlvdXIgdXBkYXRlLCB1c2UgdGhlIHdvcmRpbmc6Cj4gICAgICAgICAgICBBZGQgc3Vw
cG9ydCBmb3IgZW5hYmxpbmcgb3B0aW1pc2F0aW9ucyBpbiB0aGUga2VybmVsIHdoZW4gdGhlCj4g
ICAgICAgICAgICBaYXdycyBleHRlbnNpb24gaXMgZGV0ZWN0ZWQgYXQgYm9vdC4KPgo+IFRoZXJl
IHdhcyBzb21lIGNvbmZ1c2lvbiByZWNlbnRseSBhYm91dCB3aGF0IHRoZXNlIG9wdGlvbnMgd2Vy
ZSBhY3R1YWxseQo+IGZvciwgYmVjYXVzZSB0aGlzIG9wdGlvbiBkb2Vzbid0IGNvbnRyb2wgImR5
bmFtaWMgZGV0ZWN0aW9uIiBhcyB0aGUKPiBBQ1BJIG9yIERUIGRldGVjdGlvbiBpcyBjb21waWxl
ZCBhdCBhbGwgdGltZXMuIEkgaGFkIHdyaXR0ZW4gYSBwYXRjaCBmb3IKPiB0aGlzIHdvcmRpbmcg
aW4gb3RoZXIgb3B0aW9ucyBhdCB0aGUgdGltZSBidXQgaGFkIGZvcmdvdHRlbiB0byBwcm9wZXJs
eQo+IHNlbmQgaXQ6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA0
MTgtc3RhYmxlLXJhaWx3YXktN2NjZTA3ZTFlNDQwQHNwdWQvVC8jdQo+Cj4gPiArCj4gPiArICAg
ICAgICBUaGUgWmF3cnMgZXh0ZW5zaW9uIGRlZmluZXMgYSBwYWlyIG9mIGluc3RydWN0aW9ucyB0
byBiZSB1c2VkCj4gPiArICAgICAgICBpbiBwb2xsaW5nIGxvb3BzIHRoYXQgYWxsb3dzIGEgY29y
ZSB0byBlbnRlciBhIGxvdy1wb3dlciBzdGF0ZQo+ID4gKyAgICAgICAgYW5kIHdhaXQgb24gYSBz
dG9yZSB0byBhIG1lbW9yeSBsb2NhdGlvbi4KPiA+ICsKPiA+ICsgICAgICAgIElmIHlvdSBkb24n
dCBrbm93IHdoYXQgdG8gZG8gaGVyZSwgc2F5IFkuCj4gPiArCj4gPiAgY29uZmlnIFRPT0xDSEFJ
Tl9IQVNfVgo+ID4gICAgICAgYm9vbAo+ID4gICAgICAgZGVmYXVsdCB5Cj4gPiBAQCAtMTA3NSw2
ICsxMDkwLDE1IEBAIGVuZG1lbnUgIyAiUG93ZXIgbWFuYWdlbWVudCBvcHRpb25zIgo+ID4KPiA+
ICBtZW51ICJDUFUgUG93ZXIgTWFuYWdlbWVudCIKPiA+Cj4gPiArY29uZmlnIFJJU0NWX1pBV1JT
X0lETEUKPiA+ICsgICAgIGJvb2wgIklkbGUgdGhyZWFkIHVzaW5nIFpBV1JTIGV4dGVuc2lvbnMi
Cj4gPiArICAgICBkZXBlbmRzIG9uIFJJU0NWX0lTQV9aQVdSUwo+ID4gKyAgICAgZGVmYXVsdCB5
Cj4gPiArICAgICBoZWxwCj4gPiArICAgICAgICAgICAgIEFkZHMgc3VwcG9ydCB0byBpbXBsZW1l
bnQgaWRsZSB0aHJlYWQgdXNpbmcgWkFXUlMgZXh0ZW5zaW9uLgo+ID4gKwo+ID4gKyAgICAgICAg
ICAgICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+Cj4gSSBkb24n
dCB0aGluayB0aGlzIHNlY29uZCBvcHRpb24gaXMgbmVlZGVkLCB3aHkgd291bGQgd2Ugbm90IGFs
d2F5cyB3YW50Cj4gdG8gdXNlIHRoZSBaYXdycyB2ZXJzaW9uIG9mIHRoaXMgd2hlbiBpdCBpcyBh
dmFpbGFibGU/IENhbiB3ZSBkbyBpdAo+IHVuY29uZGl0aW9uYWxseSB3aGVuIFJJU0NWX0lTQV9a
QVdSUyBpcyBzZXQgYW5kIHRoZSBleHRlbnNpb24gaXMKPiBkZXRlY3RlZCBhdCBydW50aW1lPwo+
Cj4gQ2hlZXJzLAo+IENvbm9yLgoKSW5kZWVkLCB3ZSBjYW4gYWx3YXlzIGNob29zZSBXUlMuTlRP
IHdoZW4gZW50ZXJpbmcgaWRsZS4KClRoaXMgY29uZmlnIGlzIGludHJvZHVjZWQgZm9yIHRoZSBz
ZWNvbmQgY29tbWl0IGluIHRoaXMgcGF0Y2ggc2VyaWVzLgpJbiB0aGUgc2Vjb25kIGNvbW1pdCwg
d2UgZGV0ZWN0IHdoZXRoZXIgdGhlIHRhcmdldCBjcHUgaXMgaWRsZSB3aGVuCnNlbmRpbmcgSVBJ
IGFuZCB3cml0ZSBJUEkgaW5mbyB0byB0aGUgcmVzZXJ2ZSBzZXQgb2YgaWRsZSBjcHUgc28gYXMg
dG8KYXZvaWQgc2VuZGluZyBhIHBoeXNpY2FsIElQSS4gQmVzaWRlcywgdGhlIHRhcmdldCBpZGxl
IGNwdSBuZWVkIG5vdCB0bwpnbyB0aHJvdWdoIHRyYWRpdGlvbmFsIGludGVycnVwdCBoYW5kbGlu
ZyByb3V0aW5lLiBIb3dldmVyLCBpZiBhbGwKY3B1cyBhcmUgYnVzeSBhbmQgaGFyZGx5IGVudGVy
IGlkbGUsIHRoaXMgY29tbWl0IG1heSBpbnRyb2R1Y2UKcGVyZm9ybWFuY2Ugb3ZlcmhlYWQgb2Yg
ZXh0cmEgaW5zdHJ1Y3Rpb25zIHdoZW4gc2VuZGluZyBJUEkuIFRodXMgd2UKaW50cm9kdWNlIHRo
aXMgY29uZmlnIGp1c3QgaW4gY2FzZS4KClJlZ2FyZHMsClh1IEx1Cgo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
