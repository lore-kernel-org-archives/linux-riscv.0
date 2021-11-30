Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E86C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 16:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGUzBZghTxeEC8PvYDmTSbe62AGBNlaYgebavytLqRU=; b=b/ZtlGy3T3gAd8
	Xtyjls8FssDuPw5PKnw/HRbAGo/+1ZMvdUiKdtPSwsHdQZbXpD1eE9XjYP3bu4AmxOYVbdB8WKu6A
	28flxWfcXL5M6VCaPaKtuABurMulKbNfYxZIeFytfIK4+QxEg/TzVEFCrX/Q/xzAJS0cwNN74keU2
	PDZS+UPYQOUwCVXkY3Dvgk0Ra45jxa5VBeI8RwcZyIlv//SXKZ0gOzvVSrp2jF2Jky8MVh6+HMqWB
	B7U2emUfSUrpKMGiFqNqPBuEhZo2ELM6zlEWkPtkzzG/pSKpje/Izd3rE5hSQgNoc248g0BddWyYZ
	8Nm2KjEbQcxEPQp+TKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms5kb-0066se-12; Tue, 30 Nov 2021 16:13:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms5kC-0066j5-Do
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 16:12:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j3so45620117wrp.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 08:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zDaiQPffjNp4iybPUhurwpppB/YpQCmQGrvkn6Me5qw=;
 b=nkbZz82dt9scXK2A+g9RhTRBDyjIiR0FK5ycaMlRHqk8CiFRgdBzskWic2LZkpV+7/
 huzjaFigBUnP1mJ2QPU9Zh57PKiwB8+7JQMiX0G/vKnALPj8yJ55cWjzGMBi/vOCnFv2
 1aLVYG5DIF1bOt8wpT6QpxUObGB7Xz3T/S0tST0rKTFk32Q/HsEfeXjpTyrCf8yKLn/g
 pkmWU2LeR6kr/9q33TW0TKou1HdgaDVE/Mrw8O2zNkINud+CiflSeq42rANSEx4AK4/Y
 ZV1+uKDd6vo+ygwqiFt5SrR8JkuuzZhkN+4XbK9TGiFu+cC36uMuOqyXcpfkOvFXewla
 oBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zDaiQPffjNp4iybPUhurwpppB/YpQCmQGrvkn6Me5qw=;
 b=vCc6yLjMJ/1U8jY80cfGGJp+1hQHSGaY1+mYfm05qC0ZNrywSYabHims2gmphE5RhH
 JEKQtd90GSoXvp/z+WiA6SM9f46yivRd+CNfWWwxp47t0FXOP9wPtU18FJu9en8KgaPw
 PWhI+togBGKxNOa5egiiLO1t/bqgQMt2f8oT4/+McVT9P2fZofyKUdWdNgHKl8MhYFdn
 hS4MTc8Y+c7WJDB+6dXj7lOyrecMYwBQ0kGTI3vO1ZapMLe9BgBpvzL5Dd7LKRjiqvyk
 M0eur3RlgZAXykThI/AKPjNfLJiWr68gW3PDmPq1BjMPqWMuyLRx2c0rqCMmuVHzLeuy
 oU/Q==
X-Gm-Message-State: AOAM532guEKpgtJKVuFuZ8tTwS+zceF66mpDbv4+QhOe1/pNrQPjtwxZ
 VXdzMKOegyoi11EBwOXZBA7q/ZX+Kv24QJCl
X-Google-Smtp-Source: ABdhPJzJn7/kISZJVRhH/QR4s3BI3SCVsBSjZFNoK0tsCcq4/alh1DfkIh+mV6TEnfaHX5AecNA3lg==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr43009022wrv.12.1638288753779; 
 Tue, 30 Nov 2021 08:12:33 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id h13sm17229706wrx.82.2021.11.30.08.12.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Nov 2021 08:12:33 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAAeLtUC0Qc6ysf31sh0dkvfJD-JsREZbyFFk=Ko0vQeBRzyjaw@mail.gmail.com>
Date: Tue, 30 Nov 2021 16:12:27 +0000
Cc: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, Wei Fu <wefu@redhat.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 Dan Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>, jscheid@ventanamicro.com,
 rtrauben@gmail.com, Anup Patel <anup@brainfault.org>,
 Rob Herring <robh+dt@kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 atishp04@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <guoren@kernel.org>,
 =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 hch@lst.de, liush@allwinnertech.com, Wei Wu <lazyparser@gmail.com>,
 drew@beagleboard.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-Id: <03B8F784-4AF3-425D-99B6-F753F7970273@jrtc27.com>
References: <20211129014007.286478-1-wefu@redhat.com>
 <1909580.k68io2XIxi@diego> <D7F256F9-F31F-4663-AADD-A535E159F87C@jrtc27.com>
 <2728314.U2HhIfhhqV@diego> <C19C85E6-821B-4A87-B764-56CF4D53E7FA@jrtc27.com>
 <CAAeLtUC0Qc6ysf31sh0dkvfJD-JsREZbyFFk=Ko0vQeBRzyjaw@mail.gmail.com>
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_081236_567874_7D866B91 
X-CRM114-Status: GOOD (  20.75  )
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

T24gMzAgTm92IDIwMjEsIGF0IDE1OjAxLCBQaGlsaXBwIFRvbXNpY2ggPHBoaWxpcHAudG9tc2lj
aEB2cnVsbC5ldT4gd3JvdGU6Cj4gCj4gV2UgZGlkIHRvdWNoIG9uIHRoaXMgaW4gb3VyIGNvb3Jk
aW5hdGlvbiBjYWxsIGEgZmV3IHdlZWtzIGFnbzogdGhlCj4gZ3JvdXBpbmcgdW5kZXIgbW11IGFu
ZCB0aGUgYm9vbC1lbnRyaWVzIHdlcmUgY2hvc2VuIGJlY2F1c2Ugb2YgdGhlaXIKPiBzaW1pbGFy
aXR5IHRvIG90aGVyIGV4dGVuc2lvbnMgKGkuZS4gZm9yIFpiW2FiY3NdIHRoZXJlIGNvdWxkL3No
b3VsZAo+IGJlIGEgYm9vbC1lbnRyeSB1bmRlciBlYWNoIGNwdS1ub2RlIOKAlCBmb3Igc29tZSBa
diogZW50cmllcyBhIHN1Ym5vZGUKPiBtaWdodCBiZSBuZWVkZWQgd2l0aCBmdXJ0aGVyIHBhcmFt
ZXRlcnMpLgo+IAo+IFRoZSBzdHJpbmctYmFzZWQgYXBwcm9hY2ggKGFzIGluIHRoZSBvcmlnaW5h
bGx5IHByb3Bvc2VkICJtbXUtdHlwZT0iKQo+IHdvdWxkIGxpa2Ugbm90IHNjYWxlIHdpdGggdGhl
IHByb2xpZmVyYXRpb24gb2Ygc21hbGwgJiBtb2R1bGFyCj4gZXh0ZW5zaW9ucy4KCkkgZG9u4oCZ
dCBzZWUgd2h5IHRoZSBTdiogZXh0ZW5zaW9ucyBuZWVkIHRvIGJlIHVuZGVyIGFuIG1tdSBub2Rl
IHRoZW4sCnVubGVzcyB0aGUgaW50ZW50IGlzIHRoYXQgZXZlcnkgZXh0ZW5zaW9uIGJlIGdyb3Vw
ZWQgdW5kZXIgYSBzdWItbm9kZQood2hpY2ggZG9lc27igJl0IHNlZW0gdmlhYmxlIGR1ZSB0byBl
eHRlbnNpb25zIGxpa2UgWmJrKiwgdW5sZXNzIHlvdQpncm91cCBieSBTcywgU3YgYW5kIFopPwoK
QWxzbywgd2hhdCBpcyBnb2luZyB0byBoYXBwZW4gdG8gdGhlIGN1cnJlbnQgcmlzY3YsaXNhPyBX
aWxsIHRoYXQKY29udGludWUgdG8gZXhpc3QgYW5kIGR1cGxpY2F0ZSB0aGUgaW5mbywgb3Igd2ls
bCBrZXJuZWxzIGJlIHJlcXVpcmVkCnRvIHJlY29uc3RydWN0IHRoZSBzdHJpbmcgdGhlbXNlbHZl
cyBpZiB0aGV5IHdhbnQgdG8gZGlzcGxheSBpdCB0bwp1c2Vycz8KCkFzIGEgRnJlZUJTRCBkZXZl
bG9wZXIgSeKAmW0gb2J2aW91c2x5IG5vdCBhIHBhcnQgb2YgbWFueSBvZiB0aGVzZQpkaXNjdXNz
aW9ucywgYnV0IHdoYXQgdGhlIExpbnV4IGNvbW11bml0eSBpbXBvc2VzIGFzIHRoZSBkZXZpY2Ug
dHJlZQpiaW5kaW5ncyBoYXMgYSByZWFsIGltcGFjdCBvbiB1cy4KCkplc3MKCj4gT24gVHVlLCAz
MCBOb3YgMjAyMSBhdCAxNDo1OSwgSmVzc2ljYSBDbGFya2UgPGpydGMyN0BqcnRjMjcuY29tPiB3
cm90ZToKPj4gCj4+IE9uIDMwIE5vdiAyMDIxLCBhdCAxMzoyNywgSGVpa28gU3TDvGJuZXIgPGhl
aWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4+PiAKPj4+IEhpLAo+Pj4gCj4+PiBBbSBEaWVuc3RhZywg
MzAuIE5vdmVtYmVyIDIwMjEsIDE0OjE3OjQxIENFVCBzY2hyaWViIEplc3NpY2EgQ2xhcmtlOgo+
Pj4+IE9uIDMwIE5vdiAyMDIxLCBhdCAxMjowNywgSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVj
aC5kZT4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiBBbSBNb250YWcsIDI5LiBOb3ZlbWJlciAyMDIxLCAx
MzowNjoyMyBDRVQgc2NocmllYiBIZWlrbyBTdMO8Ym5lcjoKPj4+Pj4+IEFtIE1vbnRhZywgMjku
IE5vdmVtYmVyIDIwMjEsIDA5OjU0OjM5IENFVCBzY2hyaWViIEhlaW5yaWNoIFNjaHVjaGFyZHQ6
Cj4+Pj4+Pj4gT24gMTEvMjkvMjEgMDI6NDAsIHdlZnVAcmVkaGF0LmNvbSB3cm90ZToKPj4+Pj4+
Pj4gRnJvbTogV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+Cj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBQcmV2
aW91cyBwYXRjaCBoYXMgYWRkZWQgc3ZwYm10IGluIGFyY2gvcmlzY3YgYW5kIGFkZCAicmlzY3Ys
c3ZwbWJ0Igo+Pj4+Pj4+PiBpbiB0aGUgRFQgbW11IG5vZGUuIFVwZGF0ZSBkdC1iaW5kaW5ncyBy
ZWxhdGVkIHByb3BlcnR5IGhlcmUuCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBX
ZWkgRnUgPHdlZnVAcmVkaGF0LmNvbT4KPj4+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+Cj4+Pj4+Pj4+IENjOiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgo+Pj4+Pj4+PiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPj4+
Pj4+Pj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1s
IHwgMTAgKysrKysrKysrKwo+Pj4+Pj4+PiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KQo+Pj4+Pj4+PiAKPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4+Pj4+Pj4+IGluZGV4IGFhNWZiNjRkNTdlYi4uOWZmOWNi
ZGQ4YTg1IDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPj4+Pj4+Pj4gQEAgLTYzLDYgKzYzLDE2IEBA
IHByb3BlcnRpZXM6Cj4+Pj4+Pj4+ICAgICAgLSByaXNjdixzdjQ4Cj4+Pj4+Pj4+ICAgICAgLSBy
aXNjdixub25lCj4+Pj4+Pj4+IAo+Pj4+Pj4+PiArICBtbXU6Cj4+Pj4+Pj4gCj4+Pj4+Pj4gU2hv
dWxkbid0IHdlIGtlZXAgdGhlIGl0ZW1zIGJlIGluIGFscGhhYmV0aWMgb3JkZXIsIGkuZS4gbW11
IGJlZm9yZQo+Pj4+Pj4+IG1tdS10eXBlPwo+Pj4+Pj4+IAo+Pj4+Pj4+PiArICAgIGRlc2NyaXB0
aW9uOgo+Pj4+Pj4+PiArICAgICAgRGVzY3JpYmVzIHRoZSBDUFUncyBNTVUgU3RhbmRhcmQgRXh0
ZW5zaW9ucyBzdXBwb3J0Lgo+Pj4+Pj4+PiArICAgICAgVGhlc2UgdmFsdWVzIG9yaWdpbmF0ZSBm
cm9tIHRoZSBSSVNDLVYgUHJpdmlsZWdlZAo+Pj4+Pj4+PiArICAgICAgU3BlY2lmaWNhdGlvbiBk
b2N1bWVudCwgYXZhaWxhYmxlIGZyb20KPj4+Pj4+Pj4gKyAgICAgIGh0dHBzOi8vcmlzY3Yub3Jn
L3NwZWNpZmljYXRpb25zLwo+Pj4+Pj4+PiArICAgICRyZWY6ICcvc2NoZW1hcy90eXBlcy55YW1s
Iy9kZWZpbml0aW9ucy9zdHJpbmcnCj4+Pj4+Pj4+ICsgICAgZW51bToKPj4+Pj4+Pj4gKyAgICAg
IC0gcmlzY3Ysc3ZwbWJ0Cj4+Pj4+Pj4gCj4+Pj4+Pj4gVGhlIHByaXZpbGVnZWQgc3BlY2lmaWNh
dGlvbiBoYXMgbXVsdGlwbGUgTU1VIHJlbGF0ZWQgZXh0ZW5zaW9uczoKPj4+Pj4+PiBTdm5hcG90
LCBTdnBibXQsIFN2aW52YWwuIFNoYWxsIHRoZXkgYWxsIGJlIG1vZGVsZWQgaW4gdGhpcyBlbnVt
Pwo+Pj4+Pj4gCj4+Pj4+PiBJIHJlbWVtYmVyIGluIHNvbWUgZWFybGllciB2ZXJzaW9uIHNvbWUg
d2F5IGJhY2sgdGhlcmUgd2FzIHRoZQo+Pj4+Pj4gc3VnZ2VzdGlvbiBvZiB1c2luZyBhIHN1Yi1u
b2RlIGluc3RlYWQgYW5kIHRoZW4gYWRkaW5nIGJvb2xlYW4KPj4+Pj4+IHByb3BlcnRpZXMgZm9y
IHRoZSBzdXBwb3J0ZWQgZXh0ZW5zaW9ucy4KPj4+Pj4+IAo+Pj4+Pj4gQWthIHNvbWV0aGluZyBs
aWtlCj4+Pj4+PiAgIG1tdSB7Cj4+Pj4+PiAgICAgICAgICAgcmlzY3Ysc3ZwYm10Owo+Pj4+Pj4g
ICB9Owo+Pj4+PiAKPj4+Pj4gRm9yIHRoZSByZWNvcmQsIEknbSB0YWxraW5nIGFib3V0IHRoZSBt
YWlsIGZyb20gc2VwdGVtYmVyCj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2L0NBQWVMdFVDaGpqekcrUDh5ZzQ1R0xaTUp5NVVSMks1UlJCb0xGVlpodE9hWjVwUHRFQUBt
YWlsLmdtYWlsLmNvbS8KPj4+Pj4gCj4+Pj4+IFNvIGhhdmluZyBhIHN1Yi1ub2RlIHdvdWxkIG1h
a2UgYWRkaW5nIGZ1dHVyZSBleHRlbnNpb25zCj4+Pj4+IHdheSBuaWNlci4KPj4+PiAKPj4+PiBT
dnBibXQgaXMganVzdCBhbiBJU0EgZXh0ZW5zaW9uLCBhbmQgc2hvdWxkIGJlIHRyZWF0ZWQgbGlr
ZSBhbnkgb3RoZXIuCj4+Pj4gTGV04oCZcyBub3QgaW52ZW50IHR3byBkaWZmZXJlbnQgd2F5cyBv
ZiByZXByZXNlbnRpbmcgdGhhdCBpbiB0aGUgZGV2aWNlCj4+Pj4gdHJlZS4KPj4+IAo+Pj4gSGVp
bnJpY2ggYXNrZWQgaG93IHRoZSBvdGhlciBleHRlbnNpb25zIHNob3VsZCBiZSBoYW5kbGVkCj4+
PiAoU3ZuYXBvdCwgU3ZwYm10LCBTdmludmFsKSwgc28gd2hhdCBkbyB5b3Ugc3VnZ2VzdCB0byBk
byB3aXRoIHRoZXNlPwo+PiAKPj4gV2hhdGV2ZXIgaXMgZG9uZSBmb3IgWmJbYWJjc10sIFprKiwg
WnYqLCBaaWNibyosIGV0Yy4gVGhlcmUgbWF5IG5vdCBiZQo+PiBhIGNvbmNyZXRlIHBsYW4gZm9y
IHRoYXQgeWV0LCBidXQgdGhhdCBtZWFucyB5b3Ugc2hvdWxkIHNwZWFrIHdpdGggdGhlCj4+IHBl
b3BsZSBpbnZvbHZlZCB3aXRoIHN1Y2ggZXh0ZW5zaW9ucyBhbmQgY29tZSB1cCB3aXRoIHNvbWV0
aGluZwo+PiBhcHByb3ByaWF0ZSB0b2dldGhlci4KPj4gCj4+IEplc3MKPj4gCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
