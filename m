Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804E4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 14:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LqmTcP+6CL3RH5MHJ4zOfDye6DmwkQ4pxTPDDJLUl8=; b=LxOUd79A6uG5IJ
	tG/ONp4c6k+iSwCB9ERsOYrdM1yHTfszGeZPJJCkjpkzc6OAomoHsjWljgful0nwJPBQRFcNzAoWG
	tjJjkosftSFeokkpBsUjJY0fZRTr4idpvIQflereAQsgpJgxsjMQJaHjkeuaGEy39G09nNRTHi/aO
	yWYWTECDH1nsFZvj/uT1aW5Ehj+yG6DWORoA0QlpXWLOrJqkFfRkCuCGF+v6en3X9XU0mBmw9t34g
	idnHzNVJUVghGvXNLnmizQRfqDoazDYLjtq8aItHqPWMI3HjGjZWmfwO5y6/prlOVVbe+6pFnYCWX
	jrdLTHypBt25BiakN5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms3fl-005Se5-Ll; Tue, 30 Nov 2021 13:59:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms3fi-005SdB-C3
 for linux-riscv@lists.infradead.org; Tue, 30 Nov 2021 13:59:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 137so17553229wma.1
 for <linux-riscv@lists.infradead.org>; Tue, 30 Nov 2021 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3PiemsL8KAtgrWTeLvozkXZ216ESpLbj4E8ZhqjaNhE=;
 b=LbW0nZLCksFIENy/o9R0UJZ0ZV7oM7zFE7R4jdfkiLJpQkYAB8cxAC1joNY6rUg7w0
 D2N6D1wNohepKAR1ehbxzwXMEc325fE0f40z3JnYvLBQkIxIbsIf+1Izhpe/q7mB+B0l
 iRTLL6sastrq2r51YApKRut1fog87kLW0aLT3WbJY9SpLzKEoO8zL14Tn47UvJRmNTH2
 cvrJt4s3cFgayCqLcGrE9+T4UkhBI/COe1wm/t+DLNaqzHHfeJEd6hu3fAMVbaxeHXbI
 34aNlz5tzcYjEUXS1Bx0fL3IhalGxGofxkG/CC47c/mwYlekft91NBg99m/sls1bEHUR
 srIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=3PiemsL8KAtgrWTeLvozkXZ216ESpLbj4E8ZhqjaNhE=;
 b=y6OH5fX1XywwVLANYxqANtMPU7TtqY6lYCvqU/v+WO1//pzPqBiKOcaHnT1tkN86nc
 F9AKxA0QHQjaljaTuScP7Sr9Zi7pmo+G3hZMUhRp7o6KihFULQrs3MWqpfAuhL0m2034
 uiddVt8pWNstJqO3v8Hk0YPHDyG/S5trLCacbAl4E4WLFSDcIaQ0didu+FuQpC1ULYJG
 zn8rgBfs5c4X2iuqpmfwdizoKODwE17bTSkA6LV4UDMHpg7WL0EXEW+oc57AuEusXjcF
 UmKaqR2mXVzMKh5JJ98TOLxTNUF9fe2NDIPEWkyqlfGryA+7IJz7ngHMcB2Fk+e2/vjn
 ehlA==
X-Gm-Message-State: AOAM532v1AEW65ooVeiVjg+sLINfj0Hg+GpXVonC0M9H+ytMbcBZdEwb
 6a9kV8W+h7reMOB5tyYvf7dS1g==
X-Google-Smtp-Source: ABdhPJznhnEr+TbXJogEoD38Nn/h4WWYzXhJwrM0ZK+0x02bLXJWusEQhB0My5L3J5bQQe3n68n/6Q==
X-Received: by 2002:a7b:cbd8:: with SMTP id n24mr5145848wmi.150.1638280788820; 
 Tue, 30 Nov 2021 05:59:48 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id e12sm21905976wrq.20.2021.11.30.05.59.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Nov 2021 05:59:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <2728314.U2HhIfhhqV@diego>
Date: Tue, 30 Nov 2021 13:59:46 +0000
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Wei Fu <wefu@redhat.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 Dan Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 huffman@cadence.com, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>, jscheid@ventanamicro.com,
 rtrauben@gmail.com, Anup Patel <anup@brainfault.org>,
 Rob Herring <robh+dt@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 atishp04@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Guo Ren <guoren@kernel.org>,
 =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, hch@lst.de,
 liush@allwinnertech.com, Wei Wu <lazyparser@gmail.com>,
 drew@beagleboard.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-Id: <C19C85E6-821B-4A87-B764-56CF4D53E7FA@jrtc27.com>
References: <20211129014007.286478-1-wefu@redhat.com>
 <1909580.k68io2XIxi@diego> <D7F256F9-F31F-4663-AADD-A535E159F87C@jrtc27.com>
 <2728314.U2HhIfhhqV@diego>
To: =?utf-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_055950_438268_FA707DAD 
X-CRM114-Status: GOOD (  13.95  )
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

T24gMzAgTm92IDIwMjEsIGF0IDEzOjI3LCBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRl
PiB3cm90ZToKPiAKPiBIaSwKPiAKPiBBbSBEaWVuc3RhZywgMzAuIE5vdmVtYmVyIDIwMjEsIDE0
OjE3OjQxIENFVCBzY2hyaWViIEplc3NpY2EgQ2xhcmtlOgo+PiBPbiAzMCBOb3YgMjAyMSwgYXQg
MTI6MDcsIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Pj4gCj4+PiBB
bSBNb250YWcsIDI5LiBOb3ZlbWJlciAyMDIxLCAxMzowNjoyMyBDRVQgc2NocmllYiBIZWlrbyBT
dMO8Ym5lcjoKPj4+PiBBbSBNb250YWcsIDI5LiBOb3ZlbWJlciAyMDIxLCAwOTo1NDozOSBDRVQg
c2NocmllYiBIZWlucmljaCBTY2h1Y2hhcmR0Ogo+Pj4+PiBPbiAxMS8yOS8yMSAwMjo0MCwgd2Vm
dUByZWRoYXQuY29tIHdyb3RlOgo+Pj4+Pj4gRnJvbTogV2VpIEZ1IDx3ZWZ1QHJlZGhhdC5jb20+
Cj4+Pj4+PiAKPj4+Pj4+IFByZXZpb3VzIHBhdGNoIGhhcyBhZGRlZCBzdnBibXQgaW4gYXJjaC9y
aXNjdiBhbmQgYWRkICJyaXNjdixzdnBtYnQiCj4+Pj4+PiBpbiB0aGUgRFQgbW11IG5vZGUuIFVw
ZGF0ZSBkdC1iaW5kaW5ncyByZWxhdGVkIHByb3BlcnR5IGhlcmUuCj4+Pj4+PiAKPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IFdlaSBGdSA8d2VmdUByZWRoYXQuY29tPgo+Pj4+Pj4gQ28tZGV2ZWxvcGVk
LWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+Pj4+Pj4gQ2M6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+Cj4+Pj4+PiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNv
bT4KPj4+Pj4+IENjOiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+Pj4+Pj4gLS0t
Cj4+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1s
IHwgMTAgKysrKysrKysrKwo+Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykK
Pj4+Pj4+IAo+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvY3B1cy55YW1sCj4+Pj4+PiBpbmRleCBhYTVmYjY0ZDU3ZWIuLjlmZjljYmRkOGE4NSAx
MDA2NDQKPj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9jcHVzLnlhbWwKPj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9jcHVzLnlhbWwKPj4+Pj4+IEBAIC02Myw2ICs2MywxNiBAQCBwcm9wZXJ0aWVzOgo+
Pj4+Pj4gICAgICAgLSByaXNjdixzdjQ4Cj4+Pj4+PiAgICAgICAtIHJpc2N2LG5vbmUKPj4+Pj4+
IAo+Pj4+Pj4gKyAgbW11Ogo+Pj4+PiAKPj4+Pj4gU2hvdWxkbid0IHdlIGtlZXAgdGhlIGl0ZW1z
IGJlIGluIGFscGhhYmV0aWMgb3JkZXIsIGkuZS4gbW11IGJlZm9yZSAKPj4+Pj4gbW11LXR5cGU/
Cj4+Pj4+IAo+Pj4+Pj4gKyAgICBkZXNjcmlwdGlvbjoKPj4+Pj4+ICsgICAgICBEZXNjcmliZXMg
dGhlIENQVSdzIE1NVSBTdGFuZGFyZCBFeHRlbnNpb25zIHN1cHBvcnQuCj4+Pj4+PiArICAgICAg
VGhlc2UgdmFsdWVzIG9yaWdpbmF0ZSBmcm9tIHRoZSBSSVNDLVYgUHJpdmlsZWdlZAo+Pj4+Pj4g
KyAgICAgIFNwZWNpZmljYXRpb24gZG9jdW1lbnQsIGF2YWlsYWJsZSBmcm9tCj4+Pj4+PiArICAg
ICAgaHR0cHM6Ly9yaXNjdi5vcmcvc3BlY2lmaWNhdGlvbnMvCj4+Pj4+PiArICAgICRyZWY6ICcv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcnCj4+Pj4+PiArICAgIGVudW06
Cj4+Pj4+PiArICAgICAgLSByaXNjdixzdnBtYnQKPj4+Pj4gCj4+Pj4+IFRoZSBwcml2aWxlZ2Vk
IHNwZWNpZmljYXRpb24gaGFzIG11bHRpcGxlIE1NVSByZWxhdGVkIGV4dGVuc2lvbnM6IAo+Pj4+
PiBTdm5hcG90LCBTdnBibXQsIFN2aW52YWwuIFNoYWxsIHRoZXkgYWxsIGJlIG1vZGVsZWQgaW4g
dGhpcyBlbnVtPwo+Pj4+IAo+Pj4+IEkgcmVtZW1iZXIgaW4gc29tZSBlYXJsaWVyIHZlcnNpb24g
c29tZSB3YXkgYmFjayB0aGVyZSB3YXMgdGhlCj4+Pj4gc3VnZ2VzdGlvbiBvZiB1c2luZyBhIHN1
Yi1ub2RlIGluc3RlYWQgYW5kIHRoZW4gYWRkaW5nIGJvb2xlYW4KPj4+PiBwcm9wZXJ0aWVzIGZv
ciB0aGUgc3VwcG9ydGVkIGV4dGVuc2lvbnMuCj4+Pj4gCj4+Pj4gQWthIHNvbWV0aGluZyBsaWtl
Cj4+Pj4gCW1tdSB7Cj4+Pj4gCQlyaXNjdixzdnBibXQ7CQo+Pj4+IAl9Owo+Pj4gCj4+PiBGb3Ig
dGhlIHJlY29yZCwgSSdtIHRhbGtpbmcgYWJvdXQgdGhlIG1haWwgZnJvbSBzZXB0ZW1iZXIKPj4+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBQWVMdFVDaGpqekcrUDh5ZzQ1
R0xaTUp5NVVSMks1UlJCb0xGVlpodE9hWjVwUHRFQUBtYWlsLmdtYWlsLmNvbS8KPj4+IAo+Pj4g
U28gaGF2aW5nIGEgc3ViLW5vZGUgd291bGQgbWFrZSBhZGRpbmcgZnV0dXJlIGV4dGVuc2lvbnMK
Pj4+IHdheSBuaWNlci4KPj4gCj4+IFN2cGJtdCBpcyBqdXN0IGFuIElTQSBleHRlbnNpb24sIGFu
ZCBzaG91bGQgYmUgdHJlYXRlZCBsaWtlIGFueSBvdGhlci4KPj4gTGV04oCZcyBub3QgaW52ZW50
IHR3byBkaWZmZXJlbnQgd2F5cyBvZiByZXByZXNlbnRpbmcgdGhhdCBpbiB0aGUgZGV2aWNlCj4+
IHRyZWUuCj4gCj4gSGVpbnJpY2ggYXNrZWQgaG93IHRoZSBvdGhlciBleHRlbnNpb25zIHNob3Vs
ZCBiZSBoYW5kbGVkCj4gKFN2bmFwb3QsIFN2cGJtdCwgU3ZpbnZhbCksIHNvIHdoYXQgZG8geW91
IHN1Z2dlc3QgdG8gZG8gd2l0aCB0aGVzZT8KCldoYXRldmVyIGlzIGRvbmUgZm9yIFpiW2FiY3Nd
LCBaayosIFp2KiwgWmljYm8qLCBldGMuIFRoZXJlIG1heSBub3QgYmUKYSBjb25jcmV0ZSBwbGFu
IGZvciB0aGF0IHlldCwgYnV0IHRoYXQgbWVhbnMgeW91IHNob3VsZCBzcGVhayB3aXRoIHRoZQpw
ZW9wbGUgaW52b2x2ZWQgd2l0aCBzdWNoIGV4dGVuc2lvbnMgYW5kIGNvbWUgdXAgd2l0aCBzb21l
dGhpbmcKYXBwcm9wcmlhdGUgdG9nZXRoZXIuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
