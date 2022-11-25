Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B4BC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtezRV10VC3rBo2iGebThsPgZXxaZfp3OsXdCKdhHqo=; b=jSk7iGlWwtq+zy
	BHxBRl4JhkJrtJ0nvDodZXb/RyGqMT+eObYbXJu8uFDcfUuFipnAdyxo4u+SGJdjFGhYmWKXZoOzQ
	cqLrjYcdGgFp/H3eXK3KGlERfqx1sa9daGVgC7w70mauyaUXKrXHfHF6oEtS+/XGrdgCvfdAy0KWY
	mSjpu+GLDxbPqqqp30zxZdYW6YC7DVhpN5hX6Ro/LUloadxalZcyDnyDPlnPgt98iCAANVMXLigyn
	k6xM0yeL5XMcY5c35uxmTQtD5dklPqqPREJBBn/INWDQAh4zLsnK7rk7Y7GwoHkSridVo+hVJLis8
	QB9I7dLHBwQQ0iQJuFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybgG-000NOc-9G; Fri, 25 Nov 2022 16:36:00 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybgB-000NLV-GI
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 16:35:59 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-14286d5ebc3so5725599fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 08:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mcJDcg6l0ApobpKWZcmwqDQdkz5AnOE0bHKFaeG3xY=;
        b=WTq2p2V17IljIPmAJ6YGOFR/Fs5n9jSryT77Gf0njr1D2yrcHpVtoBEZMe2HgNRNJo
         v8GiLTncVq1bjZFKtCheLWYKQGlUsUXzaosKdLDhqp0iCaWziV+EUtsKNinL9bPOyqk/
         2ewU14QN8t9jU5Q/0i3LJVYCfT2VG3YBhte1F4evHFM5ceiMBdQ1FDXiG5uocApexz2w
         rKYYROlxNlndpfzstHm36p96zismsQTm/Tw9KwBnPb5JNcir2w1sRlIobvYz13QXr3Vz
         z+Pxdz2t2621va9k2zUPUpwQUFJC5smvdTvNASiU3wFMv9x+cN1qumd8HOkcq/BBN6Av
         iY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mcJDcg6l0ApobpKWZcmwqDQdkz5AnOE0bHKFaeG3xY=;
        b=RoXOdN4ARYv+HqwocH+thGl23+3gzJf1LuDptqZTqinHrMJZb0JN42FifZHnh//+y+
         VofmAmuQtWwOvr70AdlJFD7rEBDNzs2/+lrlu347olZkedQc2CBd/iUknOPeL2iRNmWQ
         DYE09LvK9PLvigKRgL82Ot18Rfs9HQhnu+RK+U0GuWSnRDhSsEPcgRvHIYwu2UGoScfT
         Ck7g1RtOpfFHLK3PBKE2KPVvVIZfa6yEJ11UsEBtOAcVSK0JDCY6rTFZtfFF2UwF12dI
         1gORRQE0EtkV7gcv93JUAVCgPzArOwXrh60dc+NCrr5SuCS0I+FpZTSBJhlnjmuJfg3G
         L3gg==
X-Gm-Message-State: ANoB5pl11GWsiimq9dwXHL72AhmL3kZeZVsdrm4b0je0ba/mbQrTUnrh
	opzi9QErPjZW3/5ouXi+38SwbwySLNY/5ih91GT4Gw==
X-Google-Smtp-Source: AA0mqf4BV1awdJ/uk7vUN5W4z4DndfqiacfzcGIv8w3u3CShzJ7JwFBT6uvUWtVDCE42Tjh2nhKazsJ2FK5IINPJewI=
X-Received: by 2002:a05:6870:a78e:b0:143:653:a546 with SMTP id
 x14-20020a056870a78e00b001430653a546mr11003464oao.109.1669394150325; Fri, 25
 Nov 2022 08:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud> <3259590.VLH7GnMWUR@phil> <20221125074933.2xuyaeuk5kmi5miw@kamzik>
 <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com> <20221125152821.ytipefad7oxv733t@kamzik>
In-Reply-To: <20221125152821.ytipefad7oxv733t@kamzik>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 25 Nov 2022 17:35:39 +0100
Message-ID: <CAEg0e7g132REPxisSFJZorXbSqzb4q1Tj7FC8G9pDMymt0qZuw@mail.gmail.com>
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, 
	emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_083555_565524_680D312E 
X-CRM114-Status: GOOD (  36.93  )
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

T24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgNDoyOCBQTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDI1LCAyMDIyIGF0IDEyOjI2OjQy
UE0gKzAxMDAsIENocmlzdG9waCBNw7xsbG5lciB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDI1LCAy
MDIyIGF0IDg6NDkgQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+
IHdyb3RlOgo+ID4KPiA+ID4gT24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgMTI6NTE6NTRBTSArMDEw
MCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4gPiA+ID4gQW0gRG9ubmVyc3RhZywgMjQuIE5vdmVt
YmVyIDIwMjIsIDIzOjMyOjU4IENFVCBzY2hyaWViIENvbm9yIERvb2xleToKPiA+ID4gPiA+IE9u
IFRodSwgTm92IDI0LCAyMDIyIGF0IDExOjIzOjA4UE0gKzAxMDAsIEhlaWtvIFN0w7xibmVyIHdy
b3RlOgo+ID4gPiAuLi4KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiA+ID4gPiA+ID4gPiBpbmRl
eCBiZjlkZDY3NjRiYWQuLjY2ZmYzNmE1N2UyMCAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiA+ID4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHUuYwo+ID4gPiA+ID4gPiA+ID4gQEAgLTE2Niw2ICsxNjYsNyBAQCBzdGF0aWMg
c3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YQo+ID4gPiBpc2FfZXh0X2FycltdID0gewo+ID4gPiA+
ID4gPiA+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3N0YywgUklTQ1ZfSVNBX0VYVF9T
U1RDKSwKPiA+ID4gPiA+ID4gPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWws
IFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCksCj4gPiA+ID4gPiA+ID4gPiAgICAgICBfX1JJU0NWX0lT
QV9FWFRfREFUQShzdnBibXQsIFJJU0NWX0lTQV9FWFRfU1ZQQk1UKSwKPiA+ID4gPiA+ID4gPiA+
ICsgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYiwgUklTQ1ZfSVNBX0VYVF9aQkIpLAo+ID4g
PiA+ID4gPiA+ID4gICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljYm9tLCBSSVNDVl9JU0Ff
RVhUX1pJQ0JPTSksCj4gPiA+ID4gPiA+ID4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6
aWhpbnRwYXVzZSwKPiA+ID4gUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCj4gPiA+ID4gPiA+
ID4gPiAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSgiIiwgUklTQ1ZfSVNBX0VYVF9NQVgpLAo+
ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhpcyBvbmUgSSBkbyBrbm93IHRoYXQgUGFsbWVy
IHdhbnRzIGNhbm9uaWNhbGx5IG9yZGVyZWQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gYnR3LCBpZGsg
aWYgeW91IG5vdGljZWQgYnV0IEkgYXBwZWFyIHRvIGhhdmUgcGlja2VkIGNhbm9uaWNhbCBvcmRl
cmluZwo+ID4gPiA+ID4gYXMgdG9kYXkncyB0aGluZyB0byBnZXQgY29uZnVzZWQgYWJvdXQgYSBs
b3QuCj4gPiA+ID4gPgo+ID4gPiA+ID4gWW91IHB1dCB6YmIgYWZ0ZXIgdGhlIFMgZXh0ZW50aW9u
cyAtIGRvZXMgdGhhdCBtZWFudCBpdCBpcyAqbm90KiBhbgo+ID4gPiA+ID4gIkFkZGl0aW9uYWwg
U3RhbmRhcmQgRXh0ZW5zaW9uIiBidXQgcmF0aGVyIGEgcmVndWxhciBaIG9uZT8KPiA+ID4gPgo+
ID4gPiA+IFRoaXMgY29uZnVzZXMgbWUgY29tcGxldGVseSBub3cgOi0pIC4KPiA+ID4gPgo+ID4g
Pgo+ID4gPiBDYW4gd2UgaW5zdGVhZCBwb3N0IGEgcGF0Y2ggdG8gdGhlIHNwZWMgdGhhdCBjaGFu
Z2VzIHRoZSBvcmRlciB0bwo+ID4gPiBhbHBoYWJldGljYWw/IFRoZSBvbmx5IG90aGVyIG9wdGlv
biBJIHNlZSBpcyB0byBkZXZlbG9wIGEgdG9vbCB3aGljaCBzb3J0cwo+ID4gPiBleHRlbnNpb25z
IGFuZCBldmVyeSBSSVNDLVYgZGV2ZWxvcGVyIGtlZXBzIGl0IGluIHRoZWlyIGJhY2sgcG9ja2V0
LiBBCj4gPiA+IGtlcm5lbCBzcGVjaWZpYyB0b29sIHRvIGNoZWNrIGVhY2ggbGlzdCB3ZSB3YW50
IHRvIGtlZXAgc29ydGVkIHdvdWxkIGJlCj4gPiA+IG5pY2UgdG9vLgo+ID4gPgo+ID4gPiBNeSBw
cmVmZXJlbmNlIHdvdWxkIGJlIHRvIGNoYW5nZSB0aGUgc3BlYyB0byBhbHBoYWJldGljYWwgb3Jk
ZXIsIHRob3VnaCwKPiA+ID4gYmVjYXVzZSB0aGUgc3BlYyBpc24ndCBleHBsaWNpdFsqXSBlbm91
Z2ggdG8gd3JpdGUgYSB0b29sIHRoYXQgY2FuIGhhbmRsZQo+ID4gPiBhbGwgY2FzZXMuIFdlJ2xs
IGVuZCB1cCBuZWVkaW5nIHRvIGhhdmUgY29udmVyc2F0aW9ucyBsaWtlIHRoaXMgb25lIHRvCj4g
PiA+IHdyaXRlIHRoZSB0b29sIGFuZCBldmVudHVhbGx5IHRoZSB0b29sIHdpbGwgYmUgd2hhdCBl
dmVyeW9uZSBsb29rcyB0bywKPiA+ID4gcmF0aGVyIHRoYW4gdGhlIHNwZWMuLi4KPiA+ID4KPiA+
ID4gWypdIFRoZSBzcGVjIHVzZXMgd29yZHMgbGlrZSAnY2FuJywgJ3Nob3VsZCcsIGFuZCAnY29u
dmVudGlvbmFsJy4KPiA+ID4KPiA+Cj4gPiBUaGUgdW5wcml2IHNwZWMgaXMgY2xlYXIgYWJvdXQg
dGhlIGNhbm9uaWNhbCBvcmRlciAodGFibGUgIlN0YW5kYXJkIElTQQo+ID4gZXh0ZW5zaW9uIG5h
bWVzIik6Cj4KPiBUaGUgY2FwdGlvbiB1bmRlciB0YWJsZSAyNy4xIGRvZXMgaW5kZWVkIGRlY2xh
cmUgdGhlIHRhYmxlIGRlZmluZXMgdGhlCj4gY2Fub25pY2FsIG9yZGVyIGFuZCB0aGF0IGl0ICpt
dXN0KiBiZSB1c2VkIGZvciB0aGUgbmFtZSBzdHJpbmcsIGJ1dAo+IGFsbW9zdCBldmVyeXdoZXJl
IGVsc2UgaW4gY2hhcHRlciAyNyB0aGUgd29yZCAic2hvdWxkIiBpcyB1c2VkIHRvIHN1Z2dlc3QK
PiBob3cgZXh0ZW5zaW9ucyBiZSBvcmRlcmVkIChvbmx5IFgtZXh0ZW5zaW9ucyBzYXkgd2hlcmUg
dGhleSBtdXN0IGJlKS4KPgo+ID4gMSkgQmFzZSBJU0EKPiA+IDIpIFN0YW5kYXJkIFVucHJpdiBF
eHRlbnNpb24gKG5vbiBhbHBoYWJldGljYWwpCj4KPiBUaGUgJ25vbiBhbHBoYWJldGljYWwnIHBh
cnQgbWFrZXMgdGhpcyBhIFBJVEEuCj4KPiBBbmQgc2VjdGlvbiAyNy42IHNheXMgdGhlIGZpcnN0
IGxldHRlciAiY29udmVudGlvbmFsbHkgaW5kaWNhdGVzLi4uIi4gSQo+IHN1cHBvc2Ugd2UgY2Fu
IGFzc3VtZSBpdCAibXVzdCBpbmRpY2F0ZSI/CgpJIHRoaW5rIGl0IGlzIHdoYXQgaXQgaXMgYW5k
IGNoYW5naW5nIGl0IHdvdWxkIGp1c3Qgb3BlbiBwb2ludGxlc3MgZGlzY3Vzc2lvbnMuCkZ1cnRo
ZXIsIEkgdGhpbmsgdGhhdCBjb25zaXN0ZW5jeSBpcyBtb3JlIGltcG9ydGFudCB0aGFuIHRyeWlu
ZyB0byBlc3RhYmxpc2ggYQpuZXcgc2Vjb25kIG9yZGVyaW5nIHNjaGVtZSAocmVnYXJkbGVzcyBp
ZiB0aGF0IGlzIHNpbXBsZXIgYW5kL29yIGJldHRlcikKdW5sZXNzIHdlIGhhdmUgdG8gb3ZlcmNv
bWUgdGVjaG5pY2FsIGlzc3VlcyB0aGF0IHdvdWxkIG90aGVyd2lzZSBub3QKYmUgcG9zc2libGUu
Cgo+Cj4gPiAzKSBTdGFuZGFyZCBTdXBlcnZpc29yLUxldmVsIEV4dGVuc2lvbnMKPgo+IEFyZSB0
aGUgY29udmVudGlvbnMgZm9yIHRoZSBmaXJzdCBjaGFyYWN0ZXIgb2YgUy1leHRlbnNpb25zIGRl
ZmluZWQ/IEkndmUKPiBzZWVuICdTcycgZm9yICJQcml2aWxlZ2VkIGFyY2ggYW5kIFN1cGVydmlz
b3ItbGV2ZWwgZXh0ZW5zaW9ucyIsIGUuZy4KPiBTc2NvZnBtZi4gJ1N2JyBmb3IgdmlydHVhbCBt
ZW1vcnkgKEkgZ3Vlc3MpIHJlbGF0ZWQgZXh0ZW5zaW9ucywgZS5nLgo+IFN2aW52YWwsIGFuZCB3
ZSBhcHBlYXIgdG8gYmUgdXNpbmcgYWxwaGFiZXRpY2FsIG9yZGVyIGZvciB0aGVtLgo+Cj4gPiA0
KSBTdGFuZGFyZCBNYWNoaW5lLUxldmVsIEV4dGVuc2lvbnMKPiA+IDUpIE5vbi1TdGFuZGFyZCAo
VmVuZG9yKSBFeHRlbnNpb25zCj4KPiBBbnl3YXksIGZvciB0aGUgcmVsYXRpdmVseSBlYXNpZXIg
cHJvYmxlbSBvZiB0aGlzIGtlcm5lbCBsaXN0IGFuZCB0aGlzCj4gcGF0Y2gsIHdlIGNvdWxkIGRv
IHNvbWV0aGluZyB3aXRoIGRlZmluZXMgbGlrZSBiZWxvdyBpbiBvcmRlciB0byB0cnkgYW5kCj4g
a2VlcCB0aGUgb3JkZXIgcmlnaHQuCj4KPiAvKgo+ICAqIEVhY2ggc3ViLWxpc3QgaXMgc29ydGVk
IGFscGhhYmV0aWNhbGx5Lgo+ICAqLwo+ICNkZWZpbmUgU19FWFRFTlNJT05TICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKSwgICAgICAg
ICBcCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NT
VEMpLCAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Zp
bnZhbCwgUklTQ1ZfSVNBX0VYVF9TVklOVkFMKSwgICAgICAgICAgIFwKPiAgICAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHN2cGJtdCwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpLAo+Cj4gI2RlZmlu
ZSBaaV9FWFRFTlNJT05TICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljYm9tLCBSSVNDVl9J
U0FfRVhUX1pJQ0JPTSksICAgICAgICAgICAgIFwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHppaGludHBhdXNlLCBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNFKSwKPgo+ICNkZWZpbmUg
WmJfRVhURU5TSU9OUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYiwgUklTQ1ZfSVNBX0VY
VF9aSUNCT00pLCAgICAgICAgICAgICAgICBcCj4KPiBzdGF0aWMgc3RydWN0IHJpc2N2X2lzYV9l
eHRfZGF0YSBpc2FfZXh0X2FycltdID0gewo+ICAgICAgICAgWmlfRVhURU5TSU9OUwo+ICAgICAg
ICAgWmJfRVhURU5TSU9OUwo+ICAgICAgICAgU19FWFRFTlNJT05TCj4gICAgICAgICBfX1JJU0NW
X0lTQV9FWFRfREFUQSgiIiwgUklTQ1ZfSVNBX0VYVF9NQVgpLAo+IH07CgpJdCBtaWdodCBiZSB3
b3J0aCB0byBsb29rIGhvdyBCaW51dGlscyBhcmUgZ3JvdXBpbmcgdGhlbToKICBodHRwczovL3Nv
dXJjZXdhcmUub3JnL2dpdC8/cD1iaW51dGlscy1nZGIuZ2l0O2E9YmxvYjtmPWJmZC9lbGZ4eC1y
aXNjdi5jI2wxMjYxCgpUaGV5IGFsc28gZ3JvdXAgZXh0ZW5zaW9ucyB0b2dldGhlciBidXQgdXNl
IHRoZSBmb2xsb3dpbmcgZ3JvdXBzOgoKY29uc3Qgc3RydWN0IHJpc2N2X3N1cHBvcnRlZF9leHQg
KnJpc2N2X2FsbF9zdXBwb3J0ZWRfZXh0W10gPQp7CiAgcmlzY3Zfc3VwcG9ydGVkX3N0ZF9leHQs
CiAgcmlzY3Zfc3VwcG9ydGVkX3N0ZF96X2V4dCwKICByaXNjdl9zdXBwb3J0ZWRfc3RkX3NfZXh0
LAogIHJpc2N2X3N1cHBvcnRlZF9zdGRfenhtX2V4dCwKICByaXNjdl9zdXBwb3J0ZWRfdmVuZG9y
X3hfZXh0LAogIE5VTEwKfTsKCkJSCkNocmlzdG9waAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
