Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8BACAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 08:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7VCh+L8m0yD48eTOlZwyQCv+toa8FWzJaxK2UKOlmNc=; b=H2T/y5KmVgiV7H
	RH431hbGGA6ZTD1q8qF/gw7zzBC9G4PBTTKbA/y3etl+XR+ziu/UZIyCsBzvGfKa4Vj0+MQ+tkYEc
	vquvBxezz+TDNqkmSdLeqqX9updraBjG7oFeyaN62eGBXDcefQ7mvpgZkJhfxMfeqhvrLbSAoUncG
	d/VtYmasr8kEuUqOJRnQEW6bDUmPIQDbUHt1YgYxX/SvJnkVDB7eiAny91mivbdLmHSbYjSlYqrQd
	FPRKDv4LVfbHowWwhZCm7vx6E6Lxt4O89zIV05r9+hgX/DSycqJa38x99GT8doye8AutiT2HU2wGA
	HS9jaStFA/QVIcrs4uzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mUW-0000000EEi3-1IJr;
	Sun, 28 Sep 2025 08:10:44 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mUT-0000000EEdd-1iz3
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 08:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759046992;
	bh=huo9g+Dr1a8I2hAxfoJIzoriLtdykMFTIJMj79fdbiE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=tCqGingivlTYf0T5kr3g8zWt179L0R4t59eJ/4fc5fEMcbWzFHlDMsYqfEmXuuP8j
	 WY73ufrKa/n8FK4l9bftocHNnuWSVP8B2jf1iBYq2QzNebzvSUyEzUnzQ2bQN62C+o
	 jkgQOOv1vm3CbtnGEtFGiB/ZLyxt2+gXWrNMJs78=
X-QQ-mid: zesmtpgz5t1759046985tda2350a8
X-QQ-Originating-IP: MjDykqLXBetnV6yJVyKRwtAmStF97JtuaaEOhxjiPvs=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 16:09:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 457754706677137024
EX-QQ-RecipientCnt: 9
Date: Sun, 28 Sep 2025 16:09:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 6/6] i2c: spacemit: introduce pio for k1
Message-ID: <11BACC490411452F+aNjtSOiG31hX_hrl@kernel.org>
References: <20250925-k1-i2c-atomic-v2-0-46dc13311cda@linux.spacemit.com>
 <20250925-k1-i2c-atomic-v2-6-46dc13311cda@linux.spacemit.com>
 <20250927105616-GYB1338789@gentoo.org>
 <F076AA5B04CF3445+aNiMlrTNTdI7H4PI@kernel.org>
 <20250928025400-GYB1330052@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250928025400-GYB1330052@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NtleUPfB2I+Mo5kanMnXKtmbbVqazyTIsQcMbVHAE4L7IoEjYym5wuSp
	C1IHzSHM+xNHSmKc6/Gfp23o9dSBRacnbMLsPxwgS3Aszze/giAYr0/DmZF08cCFAH8HCyY
	K0zvcPp1UN310gh6e65TwS9xQD0K2y3jDhVC9GrLgqV0oHBBAijmEm/SzD8hDC+7EJgyGgV
	TSPyRIrv7y88JxCS/jZ7dDJ/iNI+BOS5Ec/9Mltg9Lm0TrVFcRKtium1Waz9BDKwvEWq38F
	FwUEYncFBK6DVWCwiHoC7PRbSU73W7igSwIhTvA/RGr75amWD+nqbNc8bfiF4vIhUTJSFGy
	AlFRPfwuyGTJ1zlTzCBQ5sNmSpbjylHG+6l2kDZ6F6defUPEZXtCNP3zzwXllWR+57rKTQ3
	KjPnt9GHFGY9WWrqP+b0STtigyZzzzj/P7R1vt8F/DVY9izDuGz7tLcsGWvmu0IXciPbnhL
	lZg6z1ZgpYho09CjSc9Bf8Vk+6ftQ5uzHZ9B3nlFF7JLcPNVf11vc/r/T3IQ76FLh7S55yE
	6kMDUXpjEnvqPP9dqM9Dstx66hIcLAuLZtEaiLFqXZQWlF/8mQW69JRA+Mc/F2oHkcg6A2V
	KzjhqkND89MGjxuCkF/KoWM4JC/FDnwZciY0iQGi2Toogwzw7f2ECi+QuupniYZCKEx+svc
	EXzVyJWToWYqYScKJlPJF4E7I4szOwfBc0r+a+fOIVgg4ZJ1VaAphuR0LquLtJum8vHao3J
	hf/AHUQDD85LTrRseZOZu1L2qt5i0BMlQuxq7PHUTVC/VOL9/W0VWnqT9gb+Y/p5F9d9GkI
	xqQc6/UpcfyfTBcqgiDWLG+Vb/tdHLOJujAqLi8ei/SNSKvL4PsL26WvXM5PlR15fN/Ksik
	bEwy8owMtVlcz67BOwEYN0BZTAITGlIb1YVTa5Q8RTAItTeUEaivklLbV872b7sT2VNE1TS
	NVB993U/uk/bXM2+3CWBKTz7Af8tooHE4YvR2PT2mC9IgVCkmvF0nkAsuj+S1zpdjinFXrY
	1XbFj90SPKt14Ts0UKFbjmSm1ZRlteC2mXwOXRnUqOsz49ZvH3R5vH7oQI7jEafGM+jBQM2
	5ZVWUjFb4/rIPAOGw846SDN9b8c96a8+Q==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_011042_007566_DEE9E2B8 
X-CRM114-Status: GOOD (  27.68  )
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

T24gU3VuLCBTZXAgMjgsIDIwMjUgYXQgMTA6NTQ6MDBBTSArMDgwMCwgWWl4dW4gTGFuIHdyb3Rl
Ogo+IEhpIFRyb3ksCj4gCj4gT24gMDk6MTcgU3VuIDI4IFNlcCAgICAgLCBUcm95IE1pdGNoZWxs
IHdyb3RlOgo+ID4gT24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMDY6NTY6MTZQTSArMDgwMCwgWWl4
dW4gTGFuIHdyb3RlOgo+ID4gPiBPbiAxMDowMiBUaHUgMjUgU2VwICAgICAsIFRyb3kgTWl0Y2hl
bGwgd3JvdGU6Cj4gPiA+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIEkyQyBQSU8gZnVuY3Rpb25h
bGl0eSBmb3IgdGhlIFNwYWNlbWl0IEsxIFNvQywKPiA+ID4gPiBlbmFibGluZyB0aGUgdXNlIG9m
IEkyQyB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQuCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogVHJveSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4g
PiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYyB8IDE2NCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMTQwIGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWsxLmMKPiA+ID4gPiBpbmRleCA2YjkxODc3MGU2MTJlMDk4YjhhZDE3NDE4
ZjQyMGQ4N2M5NGRmMTY2Li5lNDAzZWI3ZDZmMzI5ZjRmZTVjNTI0MmY5NGNjMjEwOTRkZmYxMDVj
IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYwo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtazEuYwo+ID4gPiA+IEBAIC05Nyw2ICs5Nyw5
IEBACj4gPiA+ID4gIAo+ID4gPiAuLgo+ID4gPiA+ICBzdGF0aWMgaW50IHNwYWNlbWl0X2kyY194
ZmVyX21zZyhzdHJ1Y3Qgc3BhY2VtaXRfaTJjX2RldiAqaTJjKQo+ID4gPiA+ICB7Cj4gPiA+ID4g
IAl1bnNpZ25lZCBsb25nIHRpbWVfbGVmdDsKPiA+ID4gPiBAQCAtMzEwLDEwICszNjgsMjggQEAg
c3RhdGljIGludCBzcGFjZW1pdF9pMmNfeGZlcl9tc2coc3RydWN0IHNwYWNlbWl0X2kyY19kZXYg
KmkyYykKPiA+ID4gPiAgCj4gPiA+ID4gIAkJcmVpbml0X2NvbXBsZXRpb24oJmkyYy0+Y29tcGxl
dGUpOwo+ID4gPiA+ICAKPiA+ID4gPiAtCQlzcGFjZW1pdF9pMmNfc3RhcnQoaTJjKTsKPiA+ID4g
PiArCQlpZiAoaTJjLT5pc19waW8pIHsKPiA+ID4gPiArCQkJLyogV2UgZGlzYWJsZSB0aGUgaW50
ZXJydXB0IHRvIGF2b2lkIHVuaW50ZW5kZWQgc3B1cmlvdXMgdHJpZ2dlcnMuICovCj4gPiA+IHRo
ZSBjb21tZW50IGlzIHN1c3BpY2lvdXMsIGFuZCBzZWVtcyB3cm9uZy4uCj4gPiA+ID4gKwkJCWRp
c2FibGVfaXJxKGkyYy0+aXJxKTsKPiA+ID4gPiArCj4gPiA+IEkgZ3Vlc3MgdGhpcyBkb2Vzbid0
IGRpc2FibGUgaW50ZXJydXB0IGluIHRoZSBoYXJkd2FyZSBsYXllciwgaXQgd2lsbCBzdGlsbAo+
ID4gPiBmaXJlIGludGVycnVwdCBvbmNlIGVuYWJsZWQsIHNvIGluc3RlYWQgb2YgY2FsbGluZyBk
aXNhYmxlX2lycSgpLCB3aHkgbm90Cj4gPiA+IGRlYWxpbmcgd2l0aCBJU1Igc2V0dGluZyBvZiB0
aGUgY29udHJvbGxlcj8gSSBtZWFuIHRob3NlICJJRSBiaXRzIihpbnRlcnJ1cHQKPiA+ID4gZW5h
YmxlaW5nKSBvZiBJQ1IgUkVHSVNURVIsIGRpc2FibGluZyB0aGVtIHNob3VsZCBwcmV2ZW50IHRo
ZSBpbnRlcnJ1cHQKPiA+ID4gdHJpZ2dlcmVkPwo+ID4gRm9yIGV4YW1wbGUsIHRha2UgTVNEICht
YXN0ZXIgc3RvcCBkZXRlY3QpLgo+ID4gSWYgd2UgZGlzYWJsZSB0aGlzIGludGVycnVwdCwgZXZl
biB0aGUgaW50ZXJydXB0IHN0YXR1cyBiaXQgd2lsbCBuZXZlciBiZSB0cmlnZ2VyZWQuCj4gTm8s
IHRoaXMgaXMgbm90IHNvbWV0aGluZyBJIHVuZGVyc3RhbmQuLgo+ID4gVGhlbiBob3cgYXJlIHdl
IHN1cHBvc2VkIHRvIGtub3cgd2hlbiB0aGUgdHJhbnNmZXIgaGFzIGNvbXBsZXRlZD8KPiA+IFRo
YXTigJlzIHdoeSB3ZSBkaXNhYmxlIHRoZSBnbG9iYWwgaW50ZXJydXB0IGhlcmUsIGJ1dCBzdGls
bCBrZWVwIHRoZSBwZW5kaW5nIGJpdC4KPiBjaGVja2luZyAxOC4xLjQuMSBJQ1IgUkVHSVNURVIs
IHRoZXJlIGlzIE1hc3RlciBTdG9wIERldGVjZWQgRW5hYmxlIC0gTVNERSAoQml0WzI2XSkgYW5k
Cj4gTWFzdGVyIFN0b3AgRGV0ZWNlZCBJbnRlcnJ1cHQgRW5hYmxlIC0gTVNESUUgKEJJVFsyNV0p
Cj4geW91IGNhbiBkaXNhYmxlIE1TRElFIGJ1dCBzdGlsbCBlbmFibGUgTVNERSwgYW5kIGNoZWNr
IHN0YXR1cyBvZiBNU0QgKEJJVFsyNl0pIG9mIElTUiBSRUdJU1RFUj8KPiBpdCBzaG91bGQgc3Rp
bGwgd29yayB3aXRoIGludGVycnVwdCBkaXNhYmxlZCwgb3RoZXJ3aXNlIEknZCBjb25zaWRlciB0
aGUgaGFyZHdhcmUgaXMgYnJva2VuLgoKT2theS4ubWF5YmUgSSBtaXN1bmRlcnN0b29kIGJlZm9y
ZS4KSSdsbCByZW1vdmUgZGlzYWJsZS9lbmFibGUgdGhlIGNvbnRyb2xsZXIgSVJRIGFyb3VuZCBQ
SU8gdHJhbnNmZXJzLgoKQlRXLCB0aGUgSzEgSTJDIHBhdGNoIFsxXSBmb3IgSUxDUiBhcyB0aGUg
U0NMIGNsb2NrIGhhc24ndCBnb3R0ZW4KYW55IHJlcGxpZXMgaW4gYWdlcy4gQ291bGQgeW91IHRh
a2UgYSBsb29rPwoKTGluazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwODE0LWsx
LWkyYy1pbGNyLXYzLTEtMzE3NzIzZTc0YmNkQGxpbnV4LnNwYWNlbWl0LmNvbS8gWzFdCj4gCj4g
LS0gCj4gWWl4dW4gTGFuIChkbGFuKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
