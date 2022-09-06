Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A68FECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B63OpMxf8e0tZkOxyiA44HFYylgRn5RY7wTfK3YvIw8=; b=at+3ymSgoJK0fi
	lNoJ+TBJGvwLw+WhpLQ5YLzAe2SnK5CQDRQOhzQKl4qZ1iInSseLbnYGWfPiCMXhzUw2+v2NX6CBI
	33Dkd9RTHVnv8xLzpqYVwOlV35cMoF4+UhzNi6iFVX6Ef/+RVWP4OKJGblT0UNFfHXeATWs7PmAUj
	FW7S7Y5IqXmYWb3qo1TLljKzTB2BGmt9RT3rlv7I7cli8fFvZZ42plc6N5rouvEpxuHZNgbQY3wjZ
	gvacTxOwLPaoB78+S1Oo69MZPq33IvRkQONR8CmP7NFfJhZs5FC8Xa3xLRfO5kOzzZOvRaxznsi6G
	EFpHP5HA6F06UNFoaqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNXu-001LPe-QU; Tue, 06 Sep 2022 01:38:34 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNXl-001LFa-72
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 01:38:26 +0000
Received: by mail-io1-xd36.google.com with SMTP id 10so7869702iou.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 18:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=GJEP/iVPvYxmtbWHaBUVoD5GwAJSKprJOAI/GNdvJWQ=;
        b=W15Ev3r0KlGw/5uuAOSgYh0lZOVrDoqyQzbu0Lv4ZC8FjdoAJM9yjz9xKqfKuri+ot
         PkBfO/ogqR1JPNpRlxUutJ1xTMUejyeQLaUYwlnwb+SV8+dh06kUoPPwBP0RnT+d7Gp3
         ox0hrBjbI97Z1gcCEMTYLZfarWhAL/M7HcPZpAto7qqEHuZxgRanEmILuIDoe6eNG2gm
         u0xsuGoNbpkqqZGNA9XHaeQcqHqyD0TGR8q3dWBhNAQt2CXpOYTV/T55h0asX9nKlGUR
         1UtAQqGPM39sl+naY/oqbBWff5pxdbttwzzcwHmIp23XdabbcT1n+oalhEkQGXLC8bVm
         zMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=GJEP/iVPvYxmtbWHaBUVoD5GwAJSKprJOAI/GNdvJWQ=;
        b=TbKfeATtsXESoZck6qVSSyxhtpFzL5IVVoTLbNN11GW9szmDwkdcScCl5fFDe0ZujK
         nzpVgHKs5xdg+AV/evZPj9qABqX9HJ62UHL9LDQ1bQmr+4SLXunnkCj/Ff8b94/8APQx
         73/TFBaGnqqZvJZXLV0Jc9lDZw9uYg43Ou213Bh7TlvqarQRS5QyL99QndJOSVH0aNlb
         NH8n5x60qaJp9xe5Mebq6p2lnSeO0GMBMvY8FNiu41CuJvdDiZf4cTcsEY+UfusuNQ0H
         I1Hyw0968bA2K4JlgZ3GxuHweNaGbV46Q4fqYt2uOx1N839Wl961aXky6tNUXKE+S+zX
         /ivQ==
X-Gm-Message-State: ACgBeo1r6qMeWvx+t6Cfv3vmj2AM2pC6jb3Hl8C1bvtxTFb2mx+94CIS
	El2OsjFaleIhi2GxkJf3PNnKuQnQgtMQ2M5XlI8=
X-Google-Smtp-Source: AA6agR4V2e1Ge5uXhw4Ptpim3ZA2pdfnnYdoi0fxbpqfbRDsSMT/0wAqhWFa96iFfjT0GY8Qkw32NhdzXFc0fuW+rNE=
X-Received: by 2002:a05:6638:3047:b0:341:de2b:e489 with SMTP id
 u7-20020a056638304700b00341de2be489mr27895263jak.273.1662428302536; Mon, 05
 Sep 2022 18:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220905083125.29426-1-zong.li@sifive.com> <20220905083125.29426-6-zong.li@sifive.com>
 <74571708-be33-bee2-fdc2-01492f121cda@microchip.com>
In-Reply-To: <74571708-be33-bee2-fdc2-01492f121cda@microchip.com>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 6 Sep 2022 09:38:10 +0800
Message-ID: <CA+ZOyahFAQGPb4Ffqb_6NcaoxNLCdyBEeoY=ySJ4zLK8bhqWkg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] soc: sifive: ccache: use pr_fmt() to remove
 CCACHE: prefixes
To: Conor.Dooley@microchip.com
Cc: zong.li@sifive.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com, ben.dooks@sifive.com, bp@alien8.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_183825_430945_0EE1CF11 
X-CRM114-Status: GOOD (  21.11  )
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

PENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiDmlrwgMjAyMuW5tDnmnIg25pelIOmAseS6jCDl
h4zmmagyOjQ35a+r6YGT77yaCj4KPiBPbiAwNS8wOS8yMDIyIDA5OjMxLCBab25nIExpIHdyb3Rl
Ogo+ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPgo+ID4gRnJvbTogQmVu
IERvb2tzIDxiZW4uZG9va3NAc2lmaXZlLmNvbT4KPiA+Cj4gPiBVc2UgdGhlIHByX2ZtdCgpIG1h
Y3JvIHRvIHByZWZpeCBhbGwgdGhlIG91dHB1dCB3aXRoICJDQ0FDSEU6Igo+ID4gdG8gYXZvaWQg
aGF2aW5nIHRvIHdyaXRlIGl0IG91dCBlYWNoIHRpbWUsIG9yIG1ha2UgYSBsYXJnZSBkaWZmCj4g
PiB3aGVuIHRoZSBuZXh0IGNoYW5nZSBjb21lcyBhbG9uZy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBCZW4gRG9va3MgPGJlbi5kb29rc0BzaWZpdmUuY29tPgo+Cj4gTWlzc2luZyB5b3VyIFNvQiBh
Z2FpbiBoZXJlIFpvbmcgTGkgYnR3LCBvdGhlciB0aGFuIHRoYXQ6Cj4gUmV2aWV3ZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpUaGFua3MsIEkgd291bGQg
YWRkIGl0IGluIFYzLgoKPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9j
Y2FjaGUuYyB8IDE1ICsrKysrKysrKy0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMgYi9kcml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2NjYWNo
ZS5jCj4gPiBpbmRleCA0MDFjNjdhNDg1ZTIuLmQ3NDk2MDBjMGJmOCAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMKPiA+ICsrKyBiL2RyaXZlcnMvc29j
L3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMKPiA+IEBAIC01LDYgKzUsOSBAQAo+ID4gICAqIENvcHly
aWdodCAoQykgMjAxOC0yMDIyIFNpRml2ZSwgSW5jLgo+ID4gICAqCj4gPiAgICovCj4gPiArCj4g
PiArI2RlZmluZSBwcl9mbXQoZm10KSAiQ0NBQ0hFOiAiIGZtdAo+ID4gKwo+ID4gICNpbmNsdWRl
IDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ID4g
ICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KPiA+IEBAIC04NSwxMyArODgsMTMgQEAgc3RhdGlj
IHZvaWQgY2NhY2hlX2NvbmZpZ19yZWFkKHZvaWQpCj4gPgo+ID4gICAgICAgICBjZmcgPSByZWFk
bChjY2FjaGVfYmFzZSArIFNJRklWRV9DQ0FDSEVfQ09ORklHKTsKPiA+Cj4gPiAtICAgICAgIHBy
X2luZm8oIkNDQUNIRTogJXUgYmFua3MsICV1IHdheXMsIHNldHMvYmFuaz0lbGx1LCBieXRlcy9i
bG9jaz0lbGx1XG4iLAo+ID4gKyAgICAgICBwcl9pbmZvKCIldSBiYW5rcywgJXUgd2F5cywgc2V0
cy9iYW5rPSVsbHUsIGJ5dGVzL2Jsb2NrPSVsbHVcbiIsCj4gPiAgICAgICAgICAgICAgICAgKGNm
ZyAmIDB4ZmYpLCAoY2ZnID4+IDgpICYgMHhmZiwKPiA+ICAgICAgICAgICAgICAgICBCSVRfVUxM
KChjZmcgPj4gMTYpICYgMHhmZiksCj4gPiAgICAgICAgICAgICAgICAgQklUX1VMTCgoY2ZnID4+
IDI0KSAmIDB4ZmYpKTsKPiA+Cj4gPiAgICAgICAgIGNmZyA9IHJlYWRsKGNjYWNoZV9iYXNlICsg
U0lGSVZFX0NDQUNIRV9XQVlFTkFCTEUpOwo+ID4gLSAgICAgICBwcl9pbmZvKCJDQ0FDSEU6IElu
ZGV4IG9mIHRoZSBsYXJnZXN0IHdheSBlbmFibGVkOiAlZFxuIiwgY2ZnKTsKPiA+ICsgICAgICAg
cHJfaW5mbygiSW5kZXggb2YgdGhlIGxhcmdlc3Qgd2F5IGVuYWJsZWQ6ICVkXG4iLCBjZmcpOwo+
ID4gIH0KPiA+Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2lmaXZlX2Nj
YWNoZV9pZHNbXSA9IHsKPiA+IEBAIC0xNTQsNyArMTU3LDcgQEAgc3RhdGljIGlycXJldHVybl90
IGNjYWNoZV9pbnRfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZpY2UpCj4gPiAgICAgICAgIGlm
IChpcnEgPT0gZ19pcnFbRElSX0NPUlJdKSB7Cj4gPiAgICAgICAgICAgICAgICAgYWRkX2ggPSBy
ZWFkbChjY2FjaGVfYmFzZSArIFNJRklWRV9DQ0FDSEVfRElSRUNDRklYX0hJR0gpOwo+ID4gICAg
ICAgICAgICAgICAgIGFkZF9sID0gcmVhZGwoY2NhY2hlX2Jhc2UgKyBTSUZJVkVfQ0NBQ0hFX0RJ
UkVDQ0ZJWF9MT1cpOwo+ID4gLSAgICAgICAgICAgICAgIHByX2VycigiQ0NBQ0hFOiBEaXJFcnJv
ciBAIDB4JTA4WC4lMDhYXG4iLCBhZGRfaCwgYWRkX2wpOwo+ID4gKyAgICAgICAgICAgICAgIHBy
X2VycigiRGlyRXJyb3IgQCAweCUwOFguJTA4WFxuIiwgYWRkX2gsIGFkZF9sKTsKPiA+ICAgICAg
ICAgICAgICAgICAvKiBSZWFkaW5nIHRoaXMgcmVnaXN0ZXIgY2xlYXJzIHRoZSBEaXJFcnJvciBp
bnRlcnJ1cHQgc2lnICovCj4gPiAgICAgICAgICAgICAgICAgcmVhZGwoY2NhY2hlX2Jhc2UgKyBT
SUZJVkVfQ0NBQ0hFX0RJUkVDQ0ZJWF9DT1VOVCk7Cj4gPiAgICAgICAgICAgICAgICAgYXRvbWlj
X25vdGlmaWVyX2NhbGxfY2hhaW4oJmNjYWNoZV9lcnJfY2hhaW4sIFNJRklWRV9DQ0FDSEVfRVJS
X1RZUEVfQ0UsCj4gPiBAQCAtMTcyLDcgKzE3NSw3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBjY2Fj
aGVfaW50X2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGV2aWNlKQo+ID4gICAgICAgICBpZiAoaXJx
ID09IGdfaXJxW0RBVEFfQ09SUl0pIHsKPiA+ICAgICAgICAgICAgICAgICBhZGRfaCA9IHJlYWRs
KGNjYWNoZV9iYXNlICsgU0lGSVZFX0NDQUNIRV9EQVRFQ0NGSVhfSElHSCk7Cj4gPiAgICAgICAg
ICAgICAgICAgYWRkX2wgPSByZWFkbChjY2FjaGVfYmFzZSArIFNJRklWRV9DQ0FDSEVfREFURUND
RklYX0xPVyk7Cj4gPiAtICAgICAgICAgICAgICAgcHJfZXJyKCJDQ0FDSEU6IERhdGFFcnJvciBA
IDB4JTA4WC4lMDhYXG4iLCBhZGRfaCwgYWRkX2wpOwo+ID4gKyAgICAgICAgICAgICAgIHByX2Vy
cigiRGF0YUVycm9yIEAgMHglMDhYLiUwOFhcbiIsIGFkZF9oLCBhZGRfbCk7Cj4gPiAgICAgICAg
ICAgICAgICAgLyogUmVhZGluZyB0aGlzIHJlZ2lzdGVyIGNsZWFycyB0aGUgRGF0YUVycm9yIGlu
dGVycnVwdCBzaWcgKi8KPiA+ICAgICAgICAgICAgICAgICByZWFkbChjY2FjaGVfYmFzZSArIFNJ
RklWRV9DQ0FDSEVfREFURUNDRklYX0NPVU5UKTsKPiA+ICAgICAgICAgICAgICAgICBhdG9taWNf
bm90aWZpZXJfY2FsbF9jaGFpbigmY2NhY2hlX2Vycl9jaGFpbiwgU0lGSVZFX0NDQUNIRV9FUlJf
VFlQRV9DRSwKPiA+IEBAIC0xODEsNyArMTg0LDcgQEAgc3RhdGljIGlycXJldHVybl90IGNjYWNo
ZV9pbnRfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZpY2UpCj4gPiAgICAgICAgIGlmIChpcnEg
PT0gZ19pcnFbREFUQV9VTkNPUlJdKSB7Cj4gPiAgICAgICAgICAgICAgICAgYWRkX2ggPSByZWFk
bChjY2FjaGVfYmFzZSArIFNJRklWRV9DQ0FDSEVfREFURUNDRkFJTF9ISUdIKTsKPiA+ICAgICAg
ICAgICAgICAgICBhZGRfbCA9IHJlYWRsKGNjYWNoZV9iYXNlICsgU0lGSVZFX0NDQUNIRV9EQVRF
Q0NGQUlMX0xPVyk7Cj4gPiAtICAgICAgICAgICAgICAgcHJfZXJyKCJDQ0FDSEU6IERhdGFGYWls
IEAgMHglMDhYLiUwOFhcbiIsIGFkZF9oLCBhZGRfbCk7Cj4gPiArICAgICAgICAgICAgICAgcHJf
ZXJyKCJEYXRhRmFpbCBAIDB4JTA4WC4lMDhYXG4iLCBhZGRfaCwgYWRkX2wpOwo+ID4gICAgICAg
ICAgICAgICAgIC8qIFJlYWRpbmcgdGhpcyByZWdpc3RlciBjbGVhcnMgdGhlIERhdGFGYWlsIGlu
dGVycnVwdCBzaWcgKi8KPiA+ICAgICAgICAgICAgICAgICByZWFkbChjY2FjaGVfYmFzZSArIFNJ
RklWRV9DQ0FDSEVfREFURUNDRkFJTF9DT1VOVCk7Cj4gPiAgICAgICAgICAgICAgICAgYXRvbWlj
X25vdGlmaWVyX2NhbGxfY2hhaW4oJmNjYWNoZV9lcnJfY2hhaW4sIFNJRklWRV9DQ0FDSEVfRVJS
X1RZUEVfVUUsCj4gPiBAQCAtMjIxLDcgKzIyNCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHNpZml2
ZV9jY2FjaGVfaW5pdCh2b2lkKQo+ID4gICAgICAgICAgICAgICAgIGdfaXJxW2ldID0gaXJxX29m
X3BhcnNlX2FuZF9tYXAobnAsIGkpOwo+ID4gICAgICAgICAgICAgICAgIHJjID0gcmVxdWVzdF9p
cnEoZ19pcnFbaV0sIGNjYWNoZV9pbnRfaGFuZGxlciwgMCwgImNjYWNoZV9lY2MiLCBOVUxMKTsK
PiA+ICAgICAgICAgICAgICAgICBpZiAocmMpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IHByX2VycigiQ0NBQ0hFOiBDb3VsZCBub3QgcmVxdWVzdCBJUlEgJWRcbiIsIGdfaXJxW2ldKTsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHByX2VycigiQ291bGQgbm90IHJlcXVlc3QgSVJR
ICVkXG4iLCBnX2lycVtpXSk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7
Cj4gPiAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICB9Cj4gPiAtLQo+ID4gMi4xNy4xCj4g
Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
