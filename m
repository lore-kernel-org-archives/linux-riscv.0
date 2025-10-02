Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012F4CAC5B0
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 15:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eigHuYaqg2Lj46uOXY/FBYORwNnoeb8UyAnkpgzktME=; b=R/eIgwVVe+F01W
	IL2EUIoKFHQ+t89kkajvhpbski2qLnLxYIc1lhas5RyQhkKoMCN02nXH5cGkrDLHIQF3+ygXrb9Rs
	F67vCz5o/lileDekxFIA9TGUOhrhcquZdBaZ+7bB10sZASQsltX10caC2iOOpmKS/6dPUI9+Re1Vf
	MCHye9ueG/ei3yWG6tsVC15tRjuscTWKYQgfd03s5GU6/kyYU6Y/xMQW4La+tUhEhu5OpbtEwtlKX
	d2LF2KY0AmcK/M9FLkPxNdw9M8j07KOacOwRoSV43TaoA5Gb9s5FHT+Vzwgi3muknYdaYGXxjwhjy
	Rp+gYv+lVvorH+yN61PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4KtA-0000000AgiP-2s7V;
	Thu, 02 Oct 2025 15:06:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Kt8-0000000Agi1-1CPx
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 15:06:35 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3306eb96da1so979643a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Oct 2025 08:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20230601.gappssmtp.com; s=20230601; t=1759417593; x=1760022393; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rfAOtpJmmnifg9QC2JHL+/9O8LHKXkTHllNF53zqwqc=;
        b=IV5+QCQolxUD0zHlDK7PfCQ7EHugDcJxJmQNaMXaeun7qQa6WE83fAxRWFGvbDc+iF
         EoMtFX698d+/B7tJ/Stp9PCNsXY1pbWiCjRTPa48dtQngbfZuorb6BUDXkZcrQxWi4ZJ
         qj4yXk56+VsIYj8Gmj5u4TBznhmOkj5kw9EsQSOtkqI0F8tx5BIEeQe+7c4gqV18ruWc
         5n9A0XGbsPeX1npq4X+Nak9NKkuyGt/WntzWttFO/j34X5H7M2OpvhRsz6VJApM3TzKe
         MoLzhW+QCEXC1a0tv+/9E2t06lYtR794HkqCz6vQlgN4+mAwkmnUM0Fb8ZVINwqWPDik
         rKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417593; x=1760022393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfAOtpJmmnifg9QC2JHL+/9O8LHKXkTHllNF53zqwqc=;
        b=MqRsfVHbPK+DmSztScTsWIwexhiVgpzlc835Fe5Xua056ImrpD+bjvwJUDdKS2ffCK
         y7X2Ke2QegftGYb9vePP0PrzoWYRX3I3qemXftE3lUhxyqgYCH8jYgUmxAJFb5Xadjyd
         pLFhWn+Qke6ERbcpsjyhHsnU9ISUBaEO2t/Lk5CrIclXW0f5nWnj0we+ceBB0nqedfvF
         nm/1EnNcu6EsRQSzwg7kDzzgZMv1D7VjRMGiF6xi87IHP/XJoiMQYTvvpzwuPd3EzHxR
         H/JmB276LclX0mk5/QS94nIjg19KqIPikEHmzYZ6f/0+/2rUq3RQozglDiF8y3dy6pgL
         hyMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFqd98HdRE/xok1AmI4dGzFZ1k5FLTFiCBpS58Jm8lKOWWAjvaNX0H1r2f2M/LhKCIVeW4E1amRIr1sg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk/NjbWrfB6BTRTpVsgB7M6Y0xw9DZBH/nPt0XpXkhT7pO6aMV
	iSSw5nN30i9kYYao/7D7gM6duB1edwkKl5Pgaa0oD8L9XDRye6ZGk0iu7xiwW1iabT0PxqFXrm6
	G4DBy
X-Gm-Gg: ASbGncuFOfstMXr7RD67cHPgpm3qzt+BDnz1JwWAeycmQNnvtIsI3GUHavhMjCaH0un
	LxVpvkqFFL2qes90MwgCLwWgLt6jtoGwiVveb9WnMUCuaz9Be5cVogALxdWuwujD9XbbYzgh6Qa
	yRkEFhPRZtgQqLof5RwR9tTzxv8q3EYIc7PJv4AoNFzUKhlJfPzeB0mBfzTpvmk/k8u1nu6qRW2
	SJhJB+JDepT7qinP/AYWQ3VNK8yGv/CNCAqFocaXIMv9E6PfDNU877i3bOiNegE+uBeIwkawR2q
	6ddAbJG+9QuaNRuA+D8REn841meuGJIHtHZUSjbxc2ZRD5ZqdIhlWpU3Kl4NwYhJ8HyX2GcGAx7
	te6GGghy3z+2oJkWPtd2ZIxeqnaDD0Hfc6u3z+jSc4xs/tW67TQruxENbuhTDcZiDcHAVi4n7Dx
	yiLkgO+pNV/2o=
X-Google-Smtp-Source: AGHT+IEC8lXy2avFMbURoC9r6NpLlroK3bziveWA5z9xbUH2JRf4uvGmg66hv7DNQQupbjk/KOSGDw==
X-Received: by 2002:a17:90b:1d12:b0:332:6356:86b6 with SMTP id 98e67ed59e1d1-339a6e74980mr8858627a91.9.1759417592931;
        Thu, 02 Oct 2025 08:06:32 -0700 (PDT)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b6099f7ab4fsm2165562a12.44.2025.10.02.08.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 08:06:32 -0700 (PDT)
Date: Thu, 2 Oct 2025 08:06:24 -0700
From: Olof Johansson <olof@lixom.net>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
Message-ID: <aN6U8NtIfqd-fowQ@chonkvm.lixom.net>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
 <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
 <3c9d9f92-aaf8-4d4d-a2d9-8d6a410edc30@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c9d9f92-aaf8-4d4d-a2d9-8d6a410edc30@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_080634_452580_6679B16D 
X-CRM114-Status: GOOD (  36.23  )
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

T24gVGh1LCBPY3QgMDIsIDIwMjUgYXQgMDE6NDg6NDdQTSArMDEwMCwgQmVuIERvb2tzIHdyb3Rl
Ogo+IE9uIDMwLzA5LzIwMjUgMTc6MDQsIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+ID4gT24gVHVl
LCAzMCBTZXB0IDIwMjUgYXQgMDA6MjUsIEJlbiBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5j
by51az4gd3JvdGU6Cj4gPiA+IAo+ID4gPiBJcyB0aGVyZSBhbnkgY2hhbmNlIHNvbWUgb2YgdGhl
IGJpZy1lbmRpYW4gd29yayB3ZSBkaWQgaXMgZ2V0dGluZyBpbgo+ID4gPiBmb3IgdGhpcyByb3Vu
ZD8KPiA+IAo+ID4gT2ggQ2hyaXN0LiBJcyBzb21lYm9keSBzZXJpb3VzbHkgd29ya2luZyBvbiBC
RSBzdXBwb3J0IGluIDIwMjU/Cj4gPiAKPiA+IFdIWT8KPiA+IAo+ID4gU2VyaW91c2x5LCB0aGF0
IHNvdW5kcyBsaWtlIGp1c3QgKnN0dXBpZCouIElzIHRoZXJlIHNvbWUgYWN0dWFsIHJlYWwKPiA+
IHJlYXNvbiBmb3IgdGhpcywgb3IgaXMgaXQgbW9yZSBvZiB0aGUgIlJJU0MtViBpcyB1c2VkIGlu
IGFjYWRlbWljCj4gPiBkZXNpZ24gY2xhc3NlcyBhbmQgc28gcGVvcGxlIGp1c3Qgd2FudCB0byBk
byBlbmRpYW5uZXNzIGZvciBhY2FkZW1pYwo+ID4gcmVhc29ucyI/Cj4gPiAKPiA+IEJlY2F1c2Ug
SSdkIGJlIG1vcmUgdGhhbiBoYXBweSB0byBqdXN0IGRyYXcgYSBsaW5lIGluIHRoZSBzYW5kIGFu
ZCBzYXkKPiA+ICJOZXcgZW5kaWFubmVzcyBwcm9ibGVtcyBhcmUgc29tZWJvZHkgRUxTRVMgcHJv
YmxlbSIsIGFuZCB0ZWxsIHBlb3BsZQo+ID4gdG8gc3RvcCBiZWluZyBzaWxseS4KPiA+IAo+ID4g
TGV0J3Mgbm90IGNvbXBsaWNhdGUgdGhpbmdzIGZvciBubyBnb29kIHJlYXNvbi4gQW5kIHRoZXJl
IGlzICpOTyoKPiA+IHJlYXNvbiB0byBhZGQgbmV3IGVuZGlhbm5lc3MuCj4gCj4gV2UgZmlyc3Qg
dGFja2xlZCBiaWctZW5kaWFuIHN1cHBvcnQgb24gQVJNMzIgbmVhcmx5IDE1IHllYXJzIGFnbywg
YW5kCj4gZHJhd2luZyBvbiB0aGF0IGV4cGVyaWVuY2UsIHdlIHNhdyB2YWx1ZSBpbiBkb2luZyB0
aGUgc2FtZSB3b3JrIG9uIFJJU0MtViBhcwo+IGEgd2F5IGZvciBuZXdlciBlbmdpbmVlcnMgdG8g
Z2FpbiBoYW5kcy1vbiBleHBlcmllbmNlIGNvbnRyaWJ1dGluZyBpbiB0aGUKPiBvcGVuLgoKR2V0
dGluZyBuZXcgcGVvcGxlIGdvaW5nIGlzIGdyZWF0LCBidXQgaWYgeW91IHdlcmUgYXJvdW5kIGZv
ciB0aGF0Cm9uZSB5b3UgYWxzbyBrbm93IGp1c3QgaG93IGxpdHRsZSB1c2FnZSBpdCBzYXcgb3Zl
ciB0aW1lIC0tIHRoZSBBUk12OApiaWcgZW5kaWFuIGVuYWJsbWVudCBoYXMgYmVlbiBvbiAobWlu
aW1hbCkgbGlmZSBzdXBwb3J0IHdpdGgganVzdCBzb21lCmRvd25zdHJlYW0gdXNhZ2UgaW4gdmVu
ZG9yIGtlcm5lbHMuIEFkZGluZyB0aGUgYnVyZGVuIGZvciBldmVyeWJvZHkgdG8KbWFpbnRhaW4g
dGhpcyB3b3JrIGZvcmV2ZXIgaXMgdGhlIGZsaXAgc2lkZSBvZiB0aGUgY29pbiBoZXJlLgoKPiBO
b3cgd2XigJlyZSBzdGFydGluZyB0byBzZWUgY29tbWVyY2lhbCBjb3JlcyBvbiB0aGUgaG9yaXpv
biB0aGF0IHdpbGwgaGF2ZSB0aGUKPiBhYmlsaXR5IHRvIGJlIGVuZGlhbiBjb25maWd1cmVkIGF0
IHJ1bi10aW1lLiBGb3IgZXhhbXBsZSwgTUlQUyAodGhlIGNvbXBhbnkKPiBub3QgdGhlIElTQSkg
aGFzIGFubm91bmNlZCB0aGV5IHdpbGwgYmUgcHJvZHVjaW5nIGNvcmVzIHdpdGggY29uZmlndXJh
YmxlCj4gZW5kaWFuIChodHRwczovL21pcHMuY29tL3Byb2R1Y3RzL2hhcmR3YXJlL2k4NTAwLyku
CgpNSVBTIGhhcyBiZWVuIGRvaW5nIHNvbWUgbm90IHNvIGF3ZXNvbWUgdGhpbmdzIHRvIHRoZSBS
SVNDLVYgYXJjaGl0ZWN0dXJlCmluIHRoZSBsYXN0IHllYXIgb3Igc28uIFRoZXkndmUgcHVibGlz
aGVkIHBhdGNoc2V0cyB0aGF0IG1ha2UgaXQgc2VlbQpsaWtlIHRoYXQgdGhleSBzZWVtIHRvIGhh
dmUgdGFrZW4gc29tZSBvbGQgTUlQUyBkZXNpZ25zIGFuZCBkb25lIHRoZQpiYXJlIG1pbmltYWwg
Y29udmVyc2lvbiBvdmVyIHRvIFJJU0MtViwgc2luY2UgdGhleSBuZWVkIHRoZWlyIG93biB3ZWly
ZApzeXN0ZW0gcGVyaXBoZXJhbHMgYW5kIGhvb2tzLiBBZ2Fpbiwgd2l0aCB0aGUgYnVyZGVuIGZv
ciBldmVyeWJvZHkgdG8KbWFpbnRhaW4gYmVjYXVzZSB0aGVpciBoYXJkd2FyZSBlbmdpbmVlcnMg
Y291bGRuJ3QgYm90aGVyIHRvIGRldmVsb3AgYQpmdWxsIHByb3BlciBSSVNDLVYgY29yZS4KCldo
aWxlIEknbSBub3QgaGFwcHkgd2l0aCB0aGUgbGFjayBvZiB1cHN0cmVhbWluZyBmcm9tIHRoZSAo
bW9zdGx5CkNoaW5lc2UpIFNvQyB2ZW5kb3JzLCBhbmQgd2Ugc2hvdWxkIGJlIGVuY291cmFnaW5n
IG1vcmUgb2YgdGhlbSB0bwpjb250cmlidXRlIGRpcmVjdGx5LCBNSVBTIHNlZW1zIHRvIGJlIG1h
a2luZyBjaG9pY2VzIHRoYXQgbWlnaHQgaGF2ZQpsb25nIHRlcm0gYnVyZGVuIGZvciBhbGwgb2Yg
dXMuIFNvIGZhciB0aGUgc2xvcGUgaXMgc2xpcHBlcnkgb24gdGhlCnN5c3RlbSBzaWRlLCBidXQg
bmVlZGluZyB0byB3b3JyeSBhYm91dCBCRSBzdXBwb3J0IHNlZW1zIHRvIGJlIHN0ZXBwaW5nCm92
ZXIgdGhlIGxpbmUgZm9yIG1lIHdpdGhvdXQgc29tZSBvYnZpb3VzIGNsZWFyIHVzZSBjYXNlcyB0
aGF0IG1ha2Ugc2Vuc2UuCgo+IE5vdGUgc29tZSBvZiB0aGUgcGF0Y2hlcyB3ZSBhcmUgcHJvcG9z
aW5nIGFsc28gbWFrZSB0aGUgY29kZSBiZXR0ZXIsIHN1Y2ggYXMKPiBzd2FwcGluZyAud29yZCBm
b3IgLmluc24uCj4gCj4gPiBSSVNDLVYgaXMgZW5vdWdoIG9mIGEgbWVzcyB3aXRoIHRoZSBtaWxs
aW9ucyBvZiBzaWxseSBjb25maWd1cmF0aW9uCj4gPiBpc3N1ZXMgYWxyZWFkeS4gRG9uJ3QgbWFr
ZSBpdCBldmVuIHdvcnNlLgo+IAo+IFRoaXMgZmVlbHMgbGlrZSB0aGUgcHJpY2UgeW91IHBheSBm
b3IgbWFraW5nIGEgZmxleGlibGUgYW5kIGZyZWUgZWNvc3lzdGVtCj4gdG8gYnVpbGQgY29yZXMu
IFRoZXJlIGlzIG5vIHNpbmdsZSBhdXRob3JpdHkgbWFraW5nIHlvdSB1c2UgZXZlcnkgZmVhdHVy
ZQo+IHRoYXQgbWlnaHQgYmUgc3BlY2lmaWVkIChhbHRob3VnaCBVYnVudHUncyBjaG9pY2UgdG8g
bW92ZSBmb3J3YXJkIHdpdGggUlZBMzIKPiBmb3IgZnV0dXJlIGlzIGEgY3VycmVudCBwYWluIGZv
ciBhbnlvbmUgd2hvIGFscmVhZHkgaGFzIHB1cmNoYXNlZCBoYXJkd2FyZSkuCgpKdXN0IGJlY2F1
c2UgdGhlIGVjb3N5c3RlbSBpcyBmbGV4aWJsZSwgZG9lc24ndCBtZWFuIHlvdSBuZWVkIHRvIGVu
Y291cmFnZQphbmQgc3VwcG9ydCBldmVyeXRoaW5nIHRoYXQgZ2V0cyBidWlsdC4KCj4gU2VlIGlu
aXRpYWwgcmVwbHkgZm9yIGNvbW1lbnQgb24gTUlQUy4gV2UgYWxzbyBkb24ndCB0aGluayB0aGlz
IGEgaHVnZQo+IGNoYW5nZSBhbmQgZ2l2ZW4gbW9zdCBwcm9qZWN0cyB3ZSB3b3JrZWQgdGhyb3Vn
aCBoYWQgZmV3IChpZiBhbnkpIGlzc3Vlcwo+IHdpdGggYnVpbGRpbmcgYmlnIGVuZGlhbiwgd2Ug
dGhvdWdodCBpdCB3YXMgd29ydGggaGF2aW5nIGFuIGF0dGVtcHQgYXQgdGhpcy4KClRvIG1lLCBp
dCdzIG5vdCBhYm91dCB0aGUgaW5pdGlhbCBlZmZvcnQgYnV0IGFib3V0IHRoZSAoZm9yZXZlcikg
d29yayBvZgprZWVwaW5nIGl0IGdvaW5nIHdpdGhvdXQgcmVncmVzc2lvbnMuIE5vdyBldmVyeWJv
ZHkgd2lsbCBuZWVkIEJFIENJLCBldGMuCgo+ID4gVGVsbCBwZW9wbGUgdG8ganVzdCB0YWxrIHRv
IHRoZWlyIHRoZXJhcGlzdHMgaW5zdGVhZC4gIFRoYXQncyAqbXVjaCoKPiA+IG1vcmUgcHJvZHVj
dGl2ZS4KPiAKPiAKPiBUaGFua3MsIGJ1dCB0aGF0IGlzbid0IGhlbHBmdWwgYW5kIGlzIGp1c3Qg
bWFraW5nIHRoZSBrZXJuZWwgbG9vayBtb3JlCj4gdG94aWMuIEkgYW0gaG93ZXZlciBnb2luZyB0
byB3ZWFyIHRoZSAiSSBnb3QgcmFudGVkIGF0IGJ5IExpbnVzIGFuZAo+IHN1cnZpdmVkIiB0YWcg
d2l0aCBwcmlkZS4KCkhleSBCZW4gLS0geW91IHBvc3RlZCBhICpSRkMqIG9mIHRoZSBwYXRjaGVz
IGluIERlY2VtYmVyIDIwMjQuIEkgcmVwbGllZAp0byB0aG9zZS4gU28gZGlkIFBhbG1lci4gV2l0
aCBleGFjdGx5IHRoZXNlIGNvbmNlcm5zLiBEaWQgd2UgZ2V0IGEKcmVzcG9uc2UgZnJvbSB5b3U/
IE5vcGUuCgpTbywgc2VlbXMgbGlrZSBMaW51cyBoYXMgYmV0dGVyIHN1Y2Nlc3MgYmVpbmcgaW1w
b2xpdGUuIFRoYXQncyBhIGJ1bW1lci4KCkZvciB0aGUgUkZDIHRocmVhZCwgc2VlIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9aMlhMUzJIWDJLcUJKVzZVQGNob25rdm0ubGl4b20ubmV0LwoK
Ci1PbG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
