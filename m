Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36704C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kCHpfohmP6d7koTk/BV+LmgUipxDUTRP1Dk+XxXGnM=; b=Lm8GeR4yXPHvRb
	G7yvpLT8fTonB2Qq3Yx5SgDbV/zWGX+G8k9MN580ZwAgZLpB9xVnQimHnd/QH/U2XaAxwYPw9vR4x
	3FapRd/zBj4NAJKNb9wfIjyFqGwN96Kizu5Ee+G6xTHFljPwvmQdP6K2TUnw9zCJUrzkbty6I0IIZ
	XRlxU9G6xEMPbhpLR7YRSaz9K+/2x8483nvCx0/ycw4At4y7qB8yBPoeZqbQkgTyNFiBGh0isDxBh
	7eYlir3sz054q9qawJGStVPYbDew0Ob2QMrS/qhfEGempiqU7Cob9VIEg8Kq+RG8O6SkiRuFFEmG6
	g9HCNlPBFu1lpXJNOcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFbu-002g37-5c; Thu, 08 Sep 2022 11:22:18 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFbq-002g0J-Rt
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:22:16 +0000
Received: by mail-ed1-x530.google.com with SMTP id b16so23860600edd.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 04:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=YQeUMZJGzpzmbxLPoYBEe/RUDVzvtXQ0zVhxMRlgR2k=;
        b=O/k1Fs0ylpmY3OJQFoH4gtXSvJwb2L55NR/UZHBxb4ngRYlV+tib4dwwJTf6D7CrdZ
         hQyxTzn+RIuGi+pUQX65jXv8EBWsGjegUAw+yWNuoUhdaSo+pARQi32RUWcApx3f+uzd
         Lib0+Gk28QksOpZ4sr1lJsRjEaXyDt2XjzR1o439JaR0zdHOVSJQkSwvv7mgNDAeSH+W
         ZT0AOmfb1onr5QneDBJiyyawURTFGKd43gcN/cdsKuTJu3BzWRyMpRtXUPSW86BHYKxA
         K+uR5BkLaGPsv6rcwb97iIwcju4A3cqUjGtJdzDZtOM1fEbeuQoeVAU9M/9fJaeaohUT
         cKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YQeUMZJGzpzmbxLPoYBEe/RUDVzvtXQ0zVhxMRlgR2k=;
        b=oV++oBCaObAKyW8cz+BOzBT+BVTJ66wcW9qHxN5T6ZzFd4OfNBu/n1KSEv93FXEKNd
         EauFp8H5LlfAxqPbU4c0FSUg+AWdkaKlRg6K/u+1yKzdjWbPfvC07Qk+PDG31f4jsS0r
         T9Q975VQsESrJ5L9WLWk9BihS7rc7JH8RBxHVPak1CS3gU4H7s959ybe/jIlRhvpSjhN
         HD5XS7XrTz76w3KnFP7KnFunEq5utRvCO+EiF/tgyXf/7iQ5Ei/CC+oWKW8R8JZqn20W
         XfmiAQlYyp4OEa159MniowQpoHm6pfBqLNbKPcDS6u2IZJOoiDo9nABqQ7IaC+4dXw41
         eMqA==
X-Gm-Message-State: ACgBeo1+ZLXzsFZ4jyQh8okPecbXCPge3dIxdw7gGDrPtHWPHCuuh0S5
	W7aKlR10bvyU73OlBcKF5pE/Sw==
X-Google-Smtp-Source: AA6agR7edVP9Ib/32BJwL0QKGTxAa/rMYAmZ7mcJhgjoR40I9QDMUPaPqd5vtVDm/GUgl7IZxTe9Bw==
X-Received: by 2002:a05:6402:415:b0:446:230d:2b82 with SMTP id q21-20020a056402041500b00446230d2b82mr6765907edv.200.1662636131912;
        Thu, 08 Sep 2022 04:22:11 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090624c300b0074150f51d86sm1119494ejb.162.2022.09.08.04.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 04:22:11 -0700 (PDT)
Date: Thu, 8 Sep 2022 13:22:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Message-ID: <20220908112210.kfaxzuwlxmmipkm2@kamzik>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
 <CAOnJCULO-pSNgsvXMbCiOi72jJmOvB_UGGw87psynbXgo1K_3A@mail.gmail.com>
 <20220908071157.ajjascv5ebhbwhv4@kamzik>
 <5505900.JsnAkG3lO3@diego>
 <426C27B0-F750-4CE4-B056-EA580C67046C@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <426C27B0-F750-4CE4-B056-EA580C67046C@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_042214_948166_D832E127 
X-CRM114-Status: GOOD (  38.13  )
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

T24gVGh1LCBTZXAgMDgsIDIwMjIgYXQgMTE6NDg6MzFBTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gOCBTZXB0IDIwMjIsIGF0IDA5OjEwLCBIZWlrbyBTdMO8Ym5lciA8aGVpa29A
c250ZWNoLmRlPiB3cm90ZToKPiA+IAo+ID4gQW0gRG9ubmVyc3RhZywgOC4gU2VwdGVtYmVyIDIw
MjIsIDA5OjExOjU3IENFU1Qgc2NocmllYiBBbmRyZXcgSm9uZXM6Cj4gPj4gT24gV2VkLCBTZXAg
MDcsIDIwMjIgYXQgMDM6NDc6MDlQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gPj4+IE9u
IFR1ZSwgU2VwIDYsIDIwMjIgYXQgMTI6NDUgQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFu
YW1pY3JvLmNvbT4KPiA+Pj4gd3JvdGU6Cj4gPj4+IAo+ID4+Pj4gRnJvbTogUGFsbWVyIERhYmJl
bHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gPj4+PiAKPiA+Pj4+IFRoaXMgZml4ZXMgdHdvIGlz
c3VlczogSSB0cnVuY2F0ZWQgdGhlIHdhcm5pbmcncyBoYXJ0IElEIHdoZW4gcG9ydGluZyB0bwo+
ID4+Pj4gdGhlIDY0LWJpdCBoYXJ0IElEIGNvZGUsIGFuZCB0aGUgb3JpZ2luYWwgY29kZSdzIHdh
cm5pbmcgaGFuZGxpbmcgY291bGQKPiA+Pj4+IGZpcmUgb24gYW4gdW5pbml0aWFsaXplZCBoYXJ0
IElELgo+ID4+Pj4gCj4gPj4+PiBUaGUgYmlnZ2VzdCBjaGFuZ2UgaGVyZSBpcyB0aGF0IHJpc2N2
X2Nib21fYmxvY2tfc2l6ZSBpcyBubyBsb25nZXIKPiA+Pj4+IGluaXRpYWxpemVkLCBhcyBJTU8g
dGhlIGRlZmF1bHQgaXNuJ3Qgc2FuZTogdGhlcmUncyBub3RoaW5nIGluIHRoZSBJU0EKPiA+Pj4+
IHRoYXQgbWFuZGF0ZXMgYW55IHNwZWNpZmljIGNhY2hlIGJsb2NrIHNpemUsIHNvIGZhbGxpbmcg
YmFjayB0byBvbmUgd2lsbAo+ID4+Pj4ganVzdCBzaWxlbnRseSBwcm9kdWNlIHRoZSB3cm9uZyBh
bnN3ZXIgb24gc29tZSBzeXN0ZW1zLiBUaGlzIGFsc28KPiA+Pj4+IGNoYW5nZXMgdGhlIHByb2Jp
bmcgb3JkZXIgc28gdGhlIGNhY2hlIGJsb2NrIHNpemUgaXMga25vd24gYmVmb3JlCj4gPj4+PiBl
bmFibGluZyBaaWNib20gc3VwcG9ydC4KPiA+Pj4+IAo+ID4+Pj4gRml4ZXM6IDNhZWZiMmVlNWJk
ZCAoInJpc2N2OiBpbXBsZW1lbnQgWmljYm9tLWJhc2VkIENNTyBpbnN0cnVjdGlvbnMgKyB0aGUK
PiA+Pj4+IHQtaGVhZCB2YXJpYW50IikKPiA+Pj4+IEZpeGVzOiAxNjMxYmExMjU5ZDYgKCJyaXNj
djogQWRkIHN1cHBvcnQgZm9yIG5vbi1jb2hlcmVudCBkZXZpY2VzIHVzaW5nCj4gPj4+PiB6aWNi
b20gZXh0ZW5zaW9uIikKPiA+Pj4+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPgo+ID4+Pj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+Cj4gPj4+PiBbUmViYXNlZCBvbiBBbnVwJ3MgbW92ZSBwYXRjaCBh
bmQgYXBwbGllZCBDb25vciBEb29sZXkncyBhbmQgSGVpa28KPiA+Pj4+IFN0dWVibmVyJ3MgY2hh
bmdlcy5dCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5h
bWljcm8uY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiBhcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJh
dGEuYyB8IDEgKwo+ID4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDIgKy0KPiA+Pj4+
IGFyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jIHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCj4g
Pj4+PiBhcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jIHwgMiArKwo+ID4+Pj4gNCBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+Pj4+IAo+ID4+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gPj4+PiBi
L2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gPj4+PiBpbmRleCAyMDJjODNmNjc3
YjIuLjk2NjQ4YzE3NmYzNyAxMDA2NDQKPiA+Pj4+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL3Ro
ZWFkL2VycmF0YS5jCj4gPj4+PiArKysgYi9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEu
Ywo+ID4+Pj4gQEAgLTM3LDYgKzM3LDcgQEAgc3RhdGljIGJvb2wgZXJyYXRhX3Byb2JlX2Ntbyh1
bnNpZ25lZCBpbnQgc3RhZ2UsCj4gPj4+PiBpZiAoc3RhZ2UgPT0gUklTQ1ZfQUxURVJOQVRJVkVT
X0VBUkxZX0JPT1QpCj4gPj4+PiByZXR1cm4gZmFsc2U7Cj4gPj4+PiAKPiA+Pj4+ICsgcmlzY3Zf
Y2JvbV9ibG9ja19zaXplID0gTDFfQ0FDSEVfQllURVM7Cj4gPj4+PiByaXNjdl9ub25jb2hlcmVu
dF9zdXBwb3J0ZWQoKTsKPiA+Pj4+IHJldHVybiB0cnVlOwo+ID4+Pj4gI2Vsc2UKPiA+Pj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYwo+ID4+Pj4gaW5kZXggOTVlZjZlMmJmNDVjLi4yZGZjNDYzYjg2YmIgMTAwNjQ0Cj4g
Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPj4+PiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4gPj4+PiBAQCAtMjk2LDggKzI5Niw4IEBAIHZvaWQgX19pbml0
IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkKPiA+Pj4+IHNldHVwX3NtcCgpOwo+ID4+Pj4g
I2VuZGlmCj4gPj4+PiAKPiA+Pj4+IC0gcmlzY3ZfZmlsbF9od2NhcCgpOwo+ID4+Pj4gcmlzY3Zf
aW5pdF9jYm9tX2Jsb2Nrc2l6ZSgpOwo+ID4+Pj4gKyByaXNjdl9maWxsX2h3Y2FwKCk7Cj4gPj4+
PiBhcHBseV9ib290X2FsdGVybmF0aXZlcygpOwo+ID4+Pj4gfQo+ID4+Pj4gCj4gPj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL2NhY2hl
Zmx1c2guYwo+ID4+Pj4gaW5kZXggMzM2YzVkZWVhODcwLi5lNWIwODdiZTE1NzcgMTAwNjQ0Cj4g
Pj4+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+ID4+Pj4gKysrIGIvYXJjaC9y
aXNjdi9tbS9jYWNoZWZsdXNoLmMKPiA+Pj4+IEBAIC04OSwzOSArODksNDAgQEAgdm9pZCBmbHVz
aF9pY2FjaGVfcHRlKHB0ZV90IHB0ZSkKPiA+Pj4+IH0KPiA+Pj4+ICNlbmRpZiAvKiBDT05GSUdf
TU1VICovCj4gPj4+PiAKPiA+Pj4+IC11bnNpZ25lZCBpbnQgcmlzY3ZfY2JvbV9ibG9ja19zaXpl
ID0gTDFfQ0FDSEVfQllURVM7Cj4gPj4+PiArdW5zaWduZWQgaW50IHJpc2N2X2Nib21fYmxvY2tf
c2l6ZTsKPiA+Pj4+IAo+ID4+Pj4gI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfWklDQk9NCj4gPj4+
PiB2b2lkIHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUodm9pZCkKPiA+Pj4+IHsKPiA+Pj4+IHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZTsKPiA+Pj4+ICsgdW5zaWduZWQgbG9uZyBjYm9tX2hhcnRp
ZDsKPiA+Pj4+ICsgdTMyIHZhbCwgcHJvYmVkX2Jsb2NrX3NpemU7Cj4gPj4+PiBpbnQgcmV0Owo+
ID4+Pj4gLSB1MzIgdmFsOwo+ID4+Pj4gCj4gPj4+PiArIHByb2JlZF9ibG9ja19zaXplID0gMDsK
PiA+Pj4+IGZvcl9lYWNoX29mX2NwdV9ub2RlKG5vZGUpIHsKPiA+Pj4+IHVuc2lnbmVkIGxvbmcg
aGFydGlkOwo+ID4+Pj4gLSBpbnQgY2JvbV9oYXJ0aWQ7Cj4gPj4+PiAKPiA+Pj4+IHJldCA9IHJp
c2N2X29mX3Byb2Nlc3Nvcl9oYXJ0aWQobm9kZSwgJmhhcnRpZCk7Cj4gPj4+PiBpZiAocmV0KQo+
ID4+Pj4gY29udGludWU7Cj4gPj4+PiAKPiA+Pj4+IC0gaWYgKGhhcnRpZCA8IDApCj4gPj4+PiAt
IGNvbnRpbnVlOwo+ID4+Pj4gLQo+ID4+Pj4gLyogc2V0IGJsb2NrLXNpemUgZm9yIGNib20gZXh0
ZW5zaW9uIGlmIGF2YWlsYWJsZSAqLwo+ID4+Pj4gcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIo
bm9kZSwgInJpc2N2LGNib20tYmxvY2stc2l6ZSIsCj4gPj4+PiAmdmFsKTsKPiA+Pj4+IGlmIChy
ZXQpCj4gPj4+PiBjb250aW51ZTsKPiA+Pj4+IAo+ID4+Pj4gLSBpZiAoIXJpc2N2X2Nib21fYmxv
Y2tfc2l6ZSkgewo+ID4+Pj4gLSByaXNjdl9jYm9tX2Jsb2NrX3NpemUgPSB2YWw7Cj4gPj4+PiAr
IGlmICghcHJvYmVkX2Jsb2NrX3NpemUpIHsKPiA+Pj4+ICsgcHJvYmVkX2Jsb2NrX3NpemUgPSB2
YWw7Cj4gPj4+PiBjYm9tX2hhcnRpZCA9IGhhcnRpZDsKPiA+Pj4+IH0gZWxzZSB7Cj4gPj4+PiAt
IGlmIChyaXNjdl9jYm9tX2Jsb2NrX3NpemUgIT0gdmFsKQo+ID4+Pj4gLSBwcl93YXJuKCJjYm9t
LWJsb2NrLXNpemUgbWlzbWF0Y2hlZAo+ID4+Pj4gYmV0d2VlbiBoYXJ0cyAlZCBhbmQgJWx1XG4i
LAo+ID4+Pj4gKyBpZiAocHJvYmVkX2Jsb2NrX3NpemUgIT0gdmFsKQo+ID4+Pj4gKyBwcl93YXJu
KCJjYm9tLWJsb2NrLXNpemUgbWlzbWF0Y2hlZAo+ID4+Pj4gYmV0d2VlbiBoYXJ0cyAlbHUgYW5k
ICVsdVxuIiwKPiA+Pj4+IGNib21faGFydGlkLCBoYXJ0aWQpOwo+ID4+Pj4gCj4gPj4+IAo+ID4+
PiBNYXliZSBhZGQgbW9yZSBpbmZvIHNheWluZyB0aGUgZmlyc3Qgb25lIHdpbGwgYmUgc2VsZWN0
ZWQgaW4gdGhhdCBjYXNlIGFzCj4gPj4+IGl0IGlzIGp1c3QgYSB3YXJuaW5nLgo+ID4+IAo+ID4+
IElmIHdlIGRldGVjdCBhIG1pc21hdGNoIHRoZW4gc2hvdWxkIHdlIGRpc2FibGUgdGhlIENNTyBl
eHRlbnNpb24/Cj4gPiAKPiA+IEZyb20gYSB1c2VyJ3MgcG92IEknZCB0aGluayB0aGVpciBzeXN0
ZW0gbWlnaHQgc3RvcCB3b3JraW5nIHdpdGggZGlzYWJsZWQKPiA+IGNtbyAtIGZvciB0aGluZ3Mg
bGlrZSBuZXR3b3JraW5nIC8gbWFzcyBzdG9yYWdlIG9yIHNvLgo+ID4gCj4gPiBBbHNvIHRoZSBh
bW91bnQgb2YgbWlzYmVoYXZpb3VyIG1pZ2h0IGRlcGVuZCBvbiB3ZWF0aGVyIHRoZSB2YWx1ZSBp
cwo+ID4gc2hyaW5raW5nIG9yIGV4cGFuZGluZy4KPiA+IAo+ID4gR29pbmcgZnJvbSBibG9ja19z
aXplIHggLT4geC8yIHdpbGwgImp1c3QiIHJlc3VsdCBpbiBzb21lIGFyZWFzIGJlaW5nCj4gPiBo
YW5kbGVkIHR3aWNlLCB3aGVyZSBnb2luZyBmcm9tIHggLT4gMnggd2lsbCBsZWF2ZSBvdXQgc29t
ZSBhcmVhcywKPiA+IHdoZW4gdGhlIGNwdSBpdHNlbGYgc3RpbGwganVzdCBkb2VzICJ4IiAuCj4g
PiAKPiA+IAo+ID4gQW4gZXhwZXJpbWVudCBvbiB0aGUgRDEgc3VwcG9ydHMgdGhhdCB0aG91Z2h0
IDstKQo+ID4gd2l0aCBMMV9DQUNIRV9CWVRFUyAvIDIsIG5ldHdvcmtpbmcga2VlcHMgd29ya2lu
Zwo+ID4gd2l0aCBMMV9DQUNIRV9CWVRFUyAqIDIgKHBsdXMgYWRhcHRpbmcgTUlOQUxJR04pIGJy
ZWFrcyBuZXR3b3JraW5nLgo+ID4gCj4gPiAKPiA+IFNvIEknZCB0aGluaywgd2Ugc2hvdWxkIGxv
dWRseSB3YXJuIGFib3V0IG1pc2NvbmZpZ3VyYXRpb24gYW55d2F5LAo+ID4gYnV0IGNvdWxkIGp1
c3QgdXNlIHRoZSBzbWFsbGVzdCB2YWx1ZSBhcyBibG9ja19zaXplIChpbiBhIGZ1dHVyZSBwYXRj
aCkKPiA+IHRvIGtlZXAgdGhlIG1vc3QgYW1vdW50cyBvZiBzeXN0ZW1zIHJ1bm5pbmcgaW4gc3Vj
aCBhIGNhc2UuCj4gCj4gWW91IG5lZWQgdG8gdXNlIHRoZSBzbWFsbGVzdCBzaXplIGZvciB5b3Vy
IHN0cmlkZSBpbiBaaWNib20gaW5zdHJ1Y3Rpb24KPiBsb29wcywgYnV0IHRoZSBsYXJnZXN0IHNp
emUgYXMgeW91ciBhbGlnbm1lbnQgYW5kIHBhZGRpbmcgZ3JhbnVsYXJpdHkKPiBmb3IgYWxsb2Nh
dGlvbnMsIG90aGVyd2lzZSB5b3XigJlsbCBoYXZlIGNhY2hlIGxpbmUgYWxpYXNpbmcgb24gc29t
ZSBvZgo+IHRoZSBjb3JlcyBhbmQgaGF2ZSBjb3JyZWN0bmVzcyBpc3N1ZXMgKGludmFsaWRhdGlu
ZyB0aGluZ3Mgb3V0c2lkZSB5b3VyCj4gYWxsb2NhdGlvbiBpcyB0aGUgb2J2aW91cyBwcm9ibGVt
LCBidXQgb3RoZXIgYWxsb2NhdGlvbnMgcHVsbGluZyBpbgo+IGNhY2hlIGxpbmVzIHlvdeKAmXZl
IGp1c3QgZmx1c2hlZCBpcyBhbHNvIGEgcHJvYmxlbSkuCj4KClRoaXMgc291bmRzIGxpa2UgYSBn
b29kIGFyZ3VtZW50IHRvIG1lIHRvIGp1c3QgQlVHIG9uIGEgRFQgd2l0aAptaXNtYXRjaGVzLCBm
b3JjaW5nIHRoZSBEVCB0byBnZXQgZml4ZWQuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
