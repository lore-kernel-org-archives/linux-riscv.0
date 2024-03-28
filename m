Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05184CD1280
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 05:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iusb0Nfu4MvQx0eF1+CSCNmfQGasj2kebJZxaJjhZHw=; b=qZI3ZaQhUHoZDV
	Dc+GKnEvALCv1s4HO5RiCMn28LybYhwtUuK68FfGcQWuzFYyd9af7CreKprPCoyZKfNDL8ZuBbc3i
	rJEfGNAXdP5SmmYmHdtPRIhQALvIr7wH31i00V0H29fTEfMF/oQ4YRhV60p8SN4XGhGDRmfT2BieE
	1XIfEghSbTXQa+TxAA83L6avR6ClpeF1X3EdfX0BZl1gksF9z/V4588jkHOoC+BQ6HGzkbsKOB+aN
	+oMxO+K/vIXNEPsbkX835sLLw7m1Nqp3nGvPppwdaOY7JeGQTrHExG55r7m3/Xt8vVFMpWl0DT+nr
	uuISPLW6kCoJhZvvqmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpieH-0000000Cc50-2vjm;
	Thu, 28 Mar 2024 05:50:01 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpieE-0000000Cc2t-0Ydp
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 05:50:00 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-515ac73c516so1392520e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711604996; x=1712209796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=gcOhgzl3HdlAsYFEREUMm+T/MJNQQb1SL5sFSui3Et9UhkCCiNEW9R5NhxRzYyYXUp
         hLES3eH9IBVyFfg41hTvZMcJzEc7MJrDI6Xu/8RxB/w5bvrcpOJjBiqTaUWC5M1kryNE
         ZgchEm1Z4OCvtjVUbcAvE4Y74IxlJQMWKE4NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711604996; x=1712209796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cn31nvUNUjuzpJBbAgPyDFbqbILk+7I0RyNp0AFjRSE=;
        b=Vt3/UODkA6GWNzE4SEgI7ABHoS2+X+VWGP7OyEDTHzL7ZWxWiODSCsuKh+dqgNzLzH
         Co7zrP14BVtU8QoLTZyQgLGNdqGRYd2kplqeIybhLximpmMto5+uNv8CrSCzQO4wG2ub
         I5bJ9YarhZqmN8z5+qfiZw5YA3djompEFQzkjE5TZR5NBnqR0pYO3ISU51Pj/klMeIpq
         cdxN57sUS6oB51+XmNVnS1m4bqEdM+tAyL1bfDcM8GstspqYK9Vb0j64f+c5LnPXvrBB
         B8wskj7NbtdZgfKUuHZh1FF2uScJLjBemxC4LYuJWalrv4mQNozcFqcxA446Om8LJahx
         unyA==
X-Forwarded-Encrypted: i=1; AJvYcCX0GjkzfJynm2kLlNdTfCTJLFuoU38NdvJtkOYnnj5aa+hmN8b0nx+Fjjw1/5WY8If06hYesLzuwuczAX4ElLOLG0uApK0UzkYoSDBQwmrj
X-Gm-Message-State: AOJu0YwCrO83aYdgtus4n+KdCZl2uoS5oBDytLuvK7LPe4jNDGue5BUM
	GDGGZrlUifZqz65gwDomFsWfYPP2cW/7OTt4d/+ijNEXxAzxBFB1hqPFeyO32yRyfYNcy8SGG5A
	FclE9156fd/jeGXngYpACwnq4ioB3JFTE6cMj
X-Google-Smtp-Source: AGHT+IE9E7br29oy9RDRD35SwQNl2vwFiBtmvYXASR4vX3jKO04LtgAi9c4oMgaAsLskFkIEeHikqvJMsXTcDn6BjM0=
X-Received: by 2002:a05:6512:32bb:b0:513:dfac:b29e with SMTP id
 q27-20020a05651232bb00b00513dfacb29emr414742lfe.26.1711604995631; Wed, 27 Mar
 2024 22:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org> <20240316-germinate-browsing-6865db3a44d7@spud>
 <20240316-herring-skies-6ee1d4a9c0d2@spud> <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
In-Reply-To: <CAD=FV=VZB9Dqsw6+2WBdWxaQVA9NgK_W2n0okBOU0haDMSogPw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Mar 2024 13:49:44 +0800
Message-ID: <CAGXv+5HchqvT=J7_qsJMB7OthX-gtGp0E64Xfk3i3=DDX6o1=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple DT
To: Doug Anderson <dianders@chromium.org>, Amrit Anand <quic_amrianan@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_224958_248078_E0DBC1A9 
X-CRM114-Status: GOOD (  38.24  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, andersson@kernel.org, kernel@quicinc.com, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, konrad.dybcio@linaro.org, agross@kernel.org, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev, linux-riscv@lists.infradead.org, peter.griffin@linaro.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMTksIDIwMjQgYXQgNTozNuKAr0FNIERvdWcgQW5kZXJzb24gPGRpYW5kZXJz
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIFNhdCwgTWFyIDE2LCAyMDI0IGF0
IDk6NTHigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIFNhdCwgTWFyIDE2LCAyMDI0IGF0IDA0OjIwOjAzUE0gKzAwMDAsIENvbm9yIERvb2xleSB3
cm90ZToKPiA+ID4gT24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMDI6MjA6MzhQTSArMDAwMCwgQ2Fs
ZWIgQ29ubm9sbHkgd3JvdGU6Cj4gPiA+ID4gT24gMTQvMDMvMjAyNCAxMjoxMSwgQW1yaXQgQW5h
bmQgd3JvdGU6Cj4gPiA+ID4gMi4gQSB0b3AgbGV2ZWwgYm9hcmQtaWQgcHJvcGVydHkgdGhhdCBp
c24ndCBuYW1lc3BhY2VkIGltcGxpZXMgdGhhdCBpdAo+ID4gPiA+IGlzbid0IHZlbmRvciBzcGVj
aWZpYywgYnV0IHRoZSBwcm9wb3NlZCBpbXBsZW1lbnRhdGlvbiBkb2Vzbid0IGV2ZW4KPiA+ID4g
PiBwcmV0ZW5kIHRvIGJlIHZlbmRvciBhZ25vc3RpYy4KPiA+ID4KPiA+ID4gSSBwb2ludGVkIG91
dCBwcmV2aW91c2x5IHRoYXQgdGhlIENocm9tZWJvb2sgZ3V5cyBoYWQgc29tZSBzaW1pbGFyCj4g
PiA+IGlzc3VlcyB3aXRoIGR0YiBzZWxlY3Rpb24gd2hlbiB0aGUgT0VNIHZhcmllcyBwYXJ0cyBi
dXQgdGhlcmUgZG9lcyBub3QKPiA+ID4gc2VlbSB0byBiZSBhbnkgb2YgdGhlbSBvbiBDQyBoZXJl
Lgo+ID4KPiA+IFRoYXQncyBtYXliZSBhIGJpdCBoYXJzaCBvZiBtZSBhY3R1YWxseSwgSSBzZWUg
dGhhdCB0aGVyZSdzIGEKPiA+IGNocm9tZS1wbGF0Zm9ybSBhZGRyZXNzIG9uIENDLCBidXQgSSBk
b24ndCBrbm93IGlmIHRoYXQncyBnb25uYSByZWFjaAo+ID4gdGhlIGd1eXMgdGhhdCB3b3JrIG9u
IHRoZXNlIGRldmljZXMgKENoZW4tWXUgVHNhaSBhbmQgRG91ZyBBbmRlcnNvbiBpbgo+ID4gcGFy
dGljdWxhcikuCj4KPiBUaGFua3MgZm9yIHRoZSBDQy4gWWVhaCwgSSBkb24ndCB3YXRjaCB0aGUg
ImNocm9tZS1wbGF0Zm9ybSIgbGlzdAo+IG15c2VsZiwgdGhvdWdoIG1heWJlIEkgc2hvdWxkLi4u
Cj4KPiBUaGUgQ2hyb21lYm9vayBib290IGZsb3cgYW5kIGhvdyB3ZSd2ZSBoYW5kbGVkIHRoaXMg
c28gZmFyIGlzCj4gZG9jdW1lbnRlZCBpbiB0aGUga2VybmVsIFsxXS4gVGhpcyBtZXRob2QgaXMg
d2hhdCB3ZSd2ZSBiZWVuIHVzaW5nCj4gKHdpdGggc2xpZ2h0IG1vZGlmaWNhdGlvbnMgb3ZlciB0
aGUgeWVhcnMpIHNpbmNlIHRoZSBlYXJsaWVyIEFSTQo+IENocm9tZWJvb2tzIGFuZCBpcywgSSBi
ZWxpZXZlLCBzdXBwb3J0ZWQgaW4gYm90aCB0aGUgZGVwdGhjaGFyZ2UKPiBsb2FkZXIgKHVzZWQg
aW4gQ2hyb21lYm9va3MpIGFuZCBhbHNvIGluIFUtQm9vdCwgdGhvdWdoIGl0J3MgcG9zc2libGUK
PiAoPykgdGhhdCB0aGUgVS1Cb290IHJ1bGVzIG1pZ2h0IHZhcnkgZXZlciBzbyBzbGlnaHRseS4g
SSBoYXZlbid0IHRyaWVkCj4gdXNpbmcgVS1Cb290IHRvIGJvb3QgYSBDaHJvbWVib29rIGluIHll
YXJzLgo+Cj4gVGhlIGN1cnJlbnQgd2F5IHRoaW5ncyB3b3JrIGZvciBDaHJvbWVib29rcyBpbnZv
bHZlcyBhIGhlYXZ5IGFtb3VudCBvZgo+IGR1cGxpY2F0aW9uLiBXZSBidW5kbGUgYW4gZW50aXJl
ICJEVEIiIGZvciBldmVyeSByZWxldmFudAo+IGJvYXJkL3Jldi9za3UgY29tYmluYXRpb24gZXZl
biB0aG91Z2ggbWFueSBvZiB0aG9zZSBEVEJzIGFyZSA5OSUgdGhlCj4gc2FtZSBhcyB0aGUgb3Ro
ZXIgb25lcy4gVGhlIERUQnMgaGF2ZSBiZWVuIHJlbGF0aXZlbHkgc21hbGwgYW5kIHdlCj4gY29t
cHJlc3MgdGhlbSBzbyB0aGlzIGhhc24ndCBiZWVuIGEgbWFzc2l2ZSBkZWFsLCBidXQgaXQncyBh
bHdheXMgYmVlbgo+IG9uIHRoZSBUT0RPIGxpc3QgdG8gY29tZSB1cCB3aXRoIGEgc2NoZW1lIHRv
IHVzZSBEVCBvdmVybGF5cy4gV2UndmUKPiBhbHNvIHRhbGtlZCBhYm91dCBidW5kbGluZyBhIGRl
dmljZSB0cmVlIHRoYXQgaGFzIHRoZSBzdXBlcnNldCBvZgo+IGNvbXBvbmVudHMgYW5kIHRoZW4g
dXNpbmcgYW4gaW4ta2VybmVsIGRyaXZlciB0byBzZXQgdGhlIHN0YXR1cyBvZgo+IHNvbWUgY29t
cG9uZW50cyB0byBva2F5IGFuZCB0aGVyZSBpcyBzb21lIG92ZXJsYXAgdGhlcmUgaW4gdGhlCj4g
cG9zc2libGUgd2F5IHRvIHJlcHJlc2VudCBib2FyZCB2YXJpYW50cy4gSSB0aGluayBDaGVuLVl1
IGlzIGdvaW5nIHRvCj4gdGFsayBhYm91dCBhIGZldyBvZiB0aGVzZSB0b3BpY3MgbmV4dCBtb250
aCBhdCBFT1NTIFsyXS4KClRoYXQncyByaWdodC4gSXQncyB0aGUgbGFzdCB0YWxrIGJlZm9yZSB0
aGUgY2xvc2luZyBnYW1lIG9uIHRoZSBsYXN0IGRheS4KCkVsbGlvdCBpcyBhbHNvIHByZXNlbnRp
bmcgdGhlIGJvYXJkLWlkIHByb3Bvc2FsIGF0IEVPU1MgWzNdLCB3aGljaCBpcyB0aGUKbGFzdCB0
YWxrIG9mIGRheSAyLgoKPiBJbiB0ZXJtcyBvZiBsb29raW5nIGF0IHlvdXIgc3BlY2lmaWMgcHJv
cG9zYWwsIGl0J3MgZGVmaW5pdGVseSB0cnlpbmcKPiB0byBmYWN0b3IgaW4gYSBsb3QgbW9yZSB0
aGluZ3MgdGhhbiB0aGUgY3VycmVudCBvbmUgdGhhdCBDaHJvbWVib29rcwo+IHVzZS4gVGhlIENo
cm9tZWJvb2sgbW9kZWwgd2FzICJzaW1wbGUiIGVub3VnaCB0aGF0IHdlIGNvdWxkIGp1c3QKPiBs
ZXZlcmFnZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcsIHRob3VnaCB0aGUgd2F5IHdlIGxldmVyYWdl
IGl0IGhhcwo+IGVuZGVkIHVwIGNvbnRyb3ZlcnNpYWwgb3ZlciB0aGUgeWVhcnMuIFlvdXJzIGlz
IGRlZmluaXRlbHkgdG9vCj4gY29tcGxpY2F0ZWQgdG8gd29yayB0aGUgc2FtZSB3YXkuIEl0IHNl
ZW1zIGxpa2UgZGV2aWNlIHRyZWUgb3ZlcmxheXMKPiB3b3VsZCBiZSBhIGJldHRlciBmaXQ/IEkn
bSBub3QgYW4gZXhwZXJ0IHNvIG1heWJlIHRoaXMgaXMgYWxyZWFkeQo+IHNvbHZlZCBzb21ld2hl
cmUsIGJ1dCBJJ2QgaW1hZ2luZSB0aGUgaGFyZCBwYXJ0IGlzIGdldHRpbmcgZXZlcnlvbmUgdG8K
PiBhZ3JlZSBvbiBob3cgdG8gc3BlY2lmeSBzdHVmZiBpbiB0aGUgRFQgb3ZlcmxheSB0aGF0IGFs
bG93cyB0aGUKPiBib290bG9hZGVyIHRvIGtub3cgd2hldGhlciB0byBvdmVybGF5IGl0IG9yIG5v
dC4uLgoKSSB0aGluayBxY29tLGJvYXJkLWlkICsgcWNvbSxvZW0taWQgbWFwcyB0byBvdXIgYm9h
cmQgbmFtZSArIFNLVSBJRCArIHJldmlzaW9uLgpUaGUgZGlmZmVyZW5jZSBpcyBwcm9iYWJseSBi
ZWNhdXNlIHdlIG1ha2Ugb3VyIGRldmljZSBjb2RlbmFtZXMgcHVibGljPyBXZQpkb24ndCBhY3R1
YWxseSBoYXZlIGludGVnZXIgaWRlbnRpZmllcnMgZm9yIGVhY2ggYm9hcmQgZmFtaWx5LCB0aG91
Z2ggSSBkbwpzZWUgdGhlIGFwcGVhbCBvZiBpdC4KClNvIGl0IGxvb2tzIGxpa2UgdGhpcyBwcm9w
b3NhbCBpcyBtb3JlIGFib3V0IGlkZW50aWZ5aW5nIGJvYXJkcyB3aXRob3V0CnBvbGx1dGluZyAo
PykgdGhlIGNvbXBhdGlibGUgbmFtZXNwYWNlIHdpdGggYWxsIHNvcnRzIG9mIGNvbWJpbmF0aW9u
cwphbmQgaGFja3MgbGlrZSB3ZSBoYXZlLgoKPiBbMV0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcv
YXJjaC9hcm0vZ29vZ2xlL2Nocm9tZWJvb2stYm9vdC1mbG93Lmh0bWwKPiBbMl0gaHR0cHM6Ly9l
b3NzMjQuc2NoZWQuY29tL2V2ZW50LzFhQkdlL3NlY29uZC1zb3VyY2UtY29tcG9uZW50LXByb2Jp
bmctb24tZGV2aWNlLXRyZWUtcGxhdGZvcm1zLWNoZW4teXUtdHNhaS1nb29nbGUtbGxjCgpbM10g
aHR0cHM6Ly9lb3NzMjQuc2NoZWQuY29tL2V2ZW50LzFhQkZ5L3NoaXBwaW5nLW11bHRpcGxlLWRl
dmljZXRyZWVzLWhvdy10by1pZGVudGlmeS13aGljaC1kdGItaXMtZm9yLW15LWJvYXJkLWVsbGlv
dC1iZXJtYW4tcXVhbGNvbW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
