Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1F3EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 21:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gd9tcj9yU3ryZfL9w/gvefV+ZVWnDPiGamklaeR2Mfk=; b=RCJkha1n4TAgE5
	E1g1R2IO480ex/qY5JSZVlSd6gix0Lwpc2mJluP4Um9kb7eXI2O2P2OKFxPsoaPfD8hhKsjaV9suF
	wmT1Y2hfvTjBjXYGZ62bIo+k4hjU/cwcaijgIWwn+o+vwUz4bYNhnhCDcoyPZY4QRiTVJjMcUSrp1
	5i/Gak4X9lhfiytI3yGYmRlKS8SjLVwcFEMwtdJ80SjhByOpA9E0NGSEuC8Tts0lh5exLAGGoMe8C
	21eVLRRXJ4HfYqTAkJSXOLC4RoZ6sFkGoJUgXeW6jFOdzORKHF3jbZAMtqjVDd7DEJVkwSRYrSw8B
	lb8p5dtQhg6PG6OmoXXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJL4v-00Fvai-2B;
	Tue, 11 Jul 2023 21:39:25 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJL4t-00FvZh-0A
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 21:39:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b890e2b9b7so32088625ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689111560; x=1691703560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KtT4gFz6TTEFRseSk+gcMtJFveuGAwBprTn2TmvM3QM=;
        b=qVGDef4XTDiy2pQQAH3Cwnbtqh8ZKWeDR0YpW5oBVmIf8Ft1FfiQFB9j/nigTkpw8I
         82vXU59i3SdogLeNz/ABKCqINgA4PTDr9/ZdUPp6ZUB83Z6MdD4YHZx6qWrTB/+YO5SG
         xt3gCozG7WIu1lWUXRr3EpK+TzZRAcw2ll3vth9VDJ1GAaRvrA2V8kIgGX9kdM2Wgg3l
         stzdpWOedBvZ0uhTUpLtvsrBCTVN9HRCFZfzCFKFQAEkzZQTdhvlZETvKEQOgCpBxb1y
         lgv7BtP9O20Qjyp/f7+CQeQ3LbV13czXSXJgwRbcUJP+TfmtuZqC2GkNl1o/MlSqRGEW
         v5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689111560; x=1691703560;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtT4gFz6TTEFRseSk+gcMtJFveuGAwBprTn2TmvM3QM=;
        b=eLcHtcna1yifhbjebAz/BlswQDGx8ynnleAY2bYRqqNp+sQofCCM0RRiALmP2ol4Op
         Ri3ZmZrB043vb330ocltYFPykI3lmb9gbh7Cb4sw7NdIkmnvh+nCGh4e9B67MXBx09x0
         YVrqXm3knUJ1eLYUK/UO7zwOW4jq3mKXnKmnXW0iZQ61bjgeCSKQ9zMY/Mfae98XWcTq
         fGrxos3Kb0d8MeKWMPjzv3th9xyJ2adVXFrI8AbDro+F5ZNzyJP1tErm43B9lI3Ih80l
         H2glJPF79YM6QG5YBcppl6e7iK/hv6xS/nJrDSUhIN9MaI4lSUjw4FaHWwv1Mt+IXVMs
         dLLw==
X-Gm-Message-State: ABy/qLZVwRunX+OgFH63fDRM1T0ElPlOjjYAokTRZY+y9TPwJn3NTxnp
	XrzX9kGtj/p7PaJ/OjATc54=
X-Google-Smtp-Source: APBJJlHvfrCF++DlafNT3B6O6EffAGKpXCrh8newwF9nz4kDCviiDR8GuVNpvkxYKklGu+rZ5VQk5Q==
X-Received: by 2002:a17:903:24e:b0:1b6:80f0:d969 with SMTP id j14-20020a170903024e00b001b680f0d969mr15429164plh.11.1689111559501;
        Tue, 11 Jul 2023 14:39:19 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:9374])
        by smtp.gmail.com with ESMTPSA id bd5-20020a170902830500b001b8761c739csm2362090plb.271.2023.07.11.14.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 14:39:19 -0700 (PDT)
Date: Tue, 11 Jul 2023 11:39:17 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	kernel-team@meta.com, Linux PM list <linux-pm@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	linux-rtc@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_143923_095112_83A7FB87 
X-CRM114-Status: GOOD (  27.06  )
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

SGVsbG8sCgpPbiBUdWUsIEp1bCAxMSwgMjAyMyBhdCAwNDowNjoyMlBNICswMjAwLCBHZWVydCBV
eXR0ZXJob2V2ZW4gd3JvdGU6Cj4gT24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMzo1NeKAr1BNIEdl
ZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+ID4KPiA+IEhp
IFRlanVuLAo+ID4KPiA+IE9uIEZyaSwgTWF5IDEyLCAyMDIzIGF0IDk6NTTigK9QTSBUZWp1biBI
ZW8gPHRqQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBXb3JrcXVldWUgbm93IGF1dG9tYXRpY2Fs
bHkgbWFya3MgcGVyLWNwdSB3b3JrIGl0ZW1zIHRoYXQgaG9nIENQVSBmb3IgdG9vCj4gPiA+IGxv
bmcgYXMgQ1BVX0lOVEVOU0lWRSwgd2hpY2ggZXhjbHVkZXMgdGhlbSBmcm9tIGNvbmN1cnJlbmN5
IG1hbmFnZW1lbnQgYW5kCj4gPiA+IHByZXZlbnRzIHN0YWxsaW5nIG90aGVyIGNvbmN1cnJlbmN5
LW1hbmFnZWQgd29yayBpdGVtcy4gSWYgYSB3b3JrIGZ1bmN0aW9uCj4gPiA+IGtlZXBzIHJ1bm5p
bmcgb3ZlciB0aGUgdGhlcnNob2xkLCBpdCBsaWtlbHkgbmVlZHMgdG8gYmUgc3dpdGNoZWQgdG8g
dXNlIGFuCj4gPiA+IHVuYm91bmQgd29ya3F1ZXVlLgo+ID4gPgo+ID4gPiBUaGlzIHBhdGNoIGFk
ZHMgYSBkZWJ1ZyBtZWNoYW5pc20gd2hpY2ggdHJhY2tzIHRoZSB3b3JrIGZ1bmN0aW9ucyB3aGlj
aAo+ID4gPiB0cmlnZ2VyIHRoZSBhdXRvbWF0aWMgQ1BVX0lOVEVOU0lWRSBtZWNoYW5pc20gYW5k
IHJlcG9ydCB0aGVtIHVzaW5nCj4gPiA+IHByX3dhcm4oKSB3aXRoIGV4cG9uZW50aWFsIGJhY2tv
ZmYuCj4gPiA+Cj4gPiA+IHYyOiBEcm9wIGJvdW5jaW5nIHRocm91Z2gga3RocmVhZF93b3JrZXIg
Zm9yIHByaW50aW5nIG1lc3NhZ2VzLiBJdCB3YXMgdG8KPiA+ID4gICAgIGF2b2lkIGludHJvZHVj
aW5nIGNpcmN1bGFyIGxvY2tpbmcgZGVwZW5kZW5jeSBidXQgd2Fzbid0IGVmZmVjdGl2ZSBhcyBp
dAo+ID4gPiAgICAgc3RpbGwgaGFkIHBvb2wgbG9jayAtPiB3Y2lfbG9jayAtPiBwcmludGsgLT4g
cG9vbCBsb2NrIGxvb3AuIExldCdzIGp1c3QKPiA+ID4gICAgIHByaW50IGRpcmVjdGx5IHVzaW5n
IHByaW50a19kZWZlcnJlZCgpLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUZWp1biBIZW8g
PHRqQGtlcm5lbC5vcmc+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogUGV0ZXIgWmlqbHN0cmEgPHBldGVy
ekBpbmZyYWRlYWQub3JnPgo+ID4KPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMg
bm93IGNvbW1pdCA2MzYzODQ1MDA1MjAyMTQ4Cj4gPiAoIndvcmtxdWV1ZTogUmVwb3J0IHdvcmsg
ZnVuY3MgdGhhdCB0cmlnZ2VyIGF1dG9tYXRpYyBDUFVfSU5URU5TSVZFCj4gPiBtZWNoYW5pc20i
KSBpbiB2Ni41LXJjMS4KPiA+Cj4gPiBJIGd1ZXNzIHlvdSBhcmUgaW50ZXJlc3RlZCB0byBrbm93
IHdoZXJlIHRoaXMgdHJpZ2dlcnMuCj4gPiBJIGVuYWJsZWQgQ09ORklHX1dRX0NQVV9JTlRFTlNJ
VkVfUkVQT1JUPXksIGFuZCB0ZXN0ZWQKPiA+IHRoZSByZXN1bHQgb24gdmFyaW91cyBtYWNoaW5l
cy4uLgo+IAo+ID4gT3JhbmdlQ3JhYi9MaW51eC1vbi1MaXRlWC1WZXhSaXNjViB3aXRoIGh0MTZr
MzMgMTQtc2VnIGRpc3BsYXkgYW5kIHNzZDEzMHhkcm1mYjoKPiA+Cj4gPiAgIHdvcmtxdWV1ZTog
Y2hlY2tfbGlmZXRpbWUgaG9nZ2VkIENQVSBmb3IgPjEwMDAwdXMgNCB0aW1lcywgY29uc2lkZXIK
PiA+IHN3aXRjaGluZyB0byBXUV9VTkJPVU5ECj4gPiAgIHdvcmtxdWV1ZTogZHJtX2ZiX2hlbHBl
cl9kYW1hZ2Vfd29yayBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyAxMDI0Cj4gPiB0aW1lcywgY29u
c2lkZXIgc3dpdGNoaW5nIHRvIFdRX1VOQk9VTkQKPiA+ICAgd29ya3F1ZXVlOiBmYl9mbGFzaGN1
cnNvciBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyAxMjggdGltZXMsCj4gPiBjb25zaWRlciBzd2l0
Y2hpbmcgdG8gV1FfVU5CT1VORAo+ID4gICB3b3JrcXVldWU6IGh0MTZrMzNfc2VnMTRfdXBkYXRl
IGhvZ2dlZCBDUFUgZm9yID4xMDAwMHVzIDEyOCB0aW1lcywKPiA+IGNvbnNpZGVyIHN3aXRjaGlu
ZyB0byBXUV9VTkJPVU5ECj4gPiAgIHdvcmtxdWV1ZTogbW1jX3Jlc2NhbiBob2dnZWQgQ1BVIGZv
ciA+MTAwMDB1cyAxMjggdGltZXMsIGNvbnNpZGVyCj4gPiBzd2l0Y2hpbmcgdG8gV1FfVU5CT1VO
RAo+IAo+IEdvdCBvbmUgbW9yZSBhZnRlciBhIHdoaWxlOgo+IAo+IHdvcmtxdWV1ZTogbmVpZ2hf
bWFuYWdlZF93b3JrIGhvZ2dlZCBDUFUgZm9yID4xMDAwMHVzIDQgdGltZXMsCj4gY29uc2lkZXIg
c3dpdGNoaW5nIHRvIFdRX1VOQk9VTkQKCkkgd29uZGVyIHdoZXRoZXIgdGhlIHJpZ2h0IHRoaW5n
IHRvIGRvIGhlcmUgaXMgc29tZWhvdyBzY2FsaW5nIHRoZSB0aHJlc2hvbGQKYWNjb3JkaW5nIHRv
IHRoZSByZWxhdGl2ZSBwcm9jZXNzaW5nIHBvd2VyLiBJdCdzIGRpZmZpY3VsdCB0byBjb21lIHVw
IHdpdGggYQp0aHJlc2hvbGQgd2hpY2ggd29ya3Mgd2VsbCBhY3Jvc3MgdGhlIGxhdGVzdCAmIGZh
c3Rlc3QgYW5kIHJlYWxseSB0aW55IENQVXMuCkknbGwgdGhpbmsgYWJvdXQgaXQgc29tZSBtb3Jl
IGJ1dCBpZiB5b3UgaGF2ZSBzb21lIGlkZWFzLCBwbGVhc2UgZmVlbCBmcmVlCnRvIHN1Z2dlc3Qu
CgpUaGFua3MuCgotLSAKdGVqdW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
