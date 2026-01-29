Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC5ED46C01
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 00:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNcOenKQXYeTd1xVNpAOekHPDQW3FTI4TPQib/aGUQI=; b=DbKkvgku8EhN+d
	NKbyrvyW4XqZ+6e8rykry3ucSQChy+rB1zhB2IHTcJKAOPQFYEO5hGtgWJjIJp+irbWj0oxhjBmyC
	1JphdVaGU4wL3nA35+mTApo4LgG2u4q8cDz/jyNE2s0WHffO1igg01QnteicL8EU4LACRho66Xf1y
	7aUBcdE8XvggKf8k6taKkBOj2nqPAvDaJzdzq1Di1ZYKds+l/fbK32U2Z+r1Z0HkNM1L6Ez5a4MKH
	nTTg3JHXCZRunQCMLsk2KWai+rVB5vrELDOlyr7GBnQ3M8cMCybOJYYQGOr+Gc13F3lu8kioKlbJM
	V55i4QynNu9eNyrB87fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGCx-0000000H06H-0j4K;
	Thu, 29 Jan 2026 00:48:27 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGCt-0000000H05k-23k5
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 00:48:26 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-662fc35291eso253781eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 16:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769647702; x=1770252502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbKwb212VLN49qYjAz8qGGRthTaVQz4Y5dXEvDAnI6I=;
        b=HulDqullhLAvjxnmlKNAEpJiIaX/Jbkk/YCxI4qH8uhU/+UXnGpiQGrmgTfiNe626A
         PXQ4ZAysUnqv1oc33dmPupyvg6UpDtcRjGzxB/j0II/5/yA7ma9TBWdFWHNCQaH0H7R8
         4U+RdPEuyyghT5TDKsb/c5IpUdorQvXPj8lQxb9Ln9t7kNDYz5zCN3AYtckNRyWpVwAN
         4+XdeJmekShuSZxG95Ndv5Ul6hHAj1+ts2erfJtxIE+o095bIoQq1XuCQpAOlsGUVmWF
         PF0uXvESxk+XQdZugJXPwr4VnZx75n3WDGm3RPCtZSh2VKNfDEecuQ/aY+coyUMBcp7t
         p5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647702; x=1770252502;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbKwb212VLN49qYjAz8qGGRthTaVQz4Y5dXEvDAnI6I=;
        b=pQ1pgxlofB/GIJlLJ6O7eXFvelVDmmNJ980ubHycS/HR4bKlwBwvs8niteD0DmXgGm
         NayWHhggHoHBNPP6mI8aW6fDrdEl5ODrAL+QGs267dBMPWSGbVWtYem0dey21vyv5dhF
         XVmf9Fd6XU4VRJ9FYX6fXvRJ6MSzctokD42ljlLndy+Gwcr76znzzkytKsmNrOwPBl7u
         ScmBkAb4BerncMomsEBINRtLLzk6uRh3OKUFj//0q2XFp4jXKl6aAEmpGzJMzdlCDqf6
         9NGFD6vrhydeiIJgTQn40SKtJwNNDPtu4phIXSWvHQ69zZ9NVJ6qYQkYINg4Z02uWu5+
         wAiw==
X-Forwarded-Encrypted: i=1; AJvYcCU8jDGRhRzeBqR0j+ZOtX6iF94qU0kMUbe8NHl4I/GIa+wlANkt2lE87AUzteBJahvyikDyMuvbywu3Hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxEcGOMCl7JZ4XZ9/VKXf9UGspBbIOax4jf0vOV3e2Qbk8ukIZ
	PERwjOM5e6NtzTerco+oYK/+WXaISoQCHfXdSENzHOI7VpW0DtT2Lc1Lq6EJXgEoRX8=
X-Gm-Gg: AZuq6aI53QHysMSzSRnhZCKV5NuI62JRLFqMI75V0m1Yi1nfL6FSeRRdKNFil/dj5v0
	aHa0TPSCTerdLl43qKOQ1+7dJowg+afPONkRHSZuj+q0AQpgA4ZWES0Z1cBXcyo3xDfywIE48LH
	/J1690m665DLNsMNbPnzXB3NFAVSDCjevSB/rw35Qx7l3773gRXLkOhKoqpE+qOEs89N6WQkoFv
	aKHGlaaF7gdL5dxTXKdcB8HkciQaToYW0ej879XGfzcIxaHWi3CKuUiNHT9qQ3AIcNpR8Gt6DT+
	JJGo0iGy+G5TN4kqiKbuVqIEdOWnTCpJ94FtrLVpR/5TU9r6NX5Ld3QAV7CBUJ6OBpwYjtCh9Nx
	Ufd7oqUzVI3dkm+inaGjlz96ol0PKBunZfE3eRJaqmH7zTLIwOxEH2lNMnJfH35vaveqHiA/n53
	h8gl55ON/jORG27Ba5nQ6yxNRc35GUtGfmXZZkkBLAs3SF9yO7F78=
X-Received: by 2002:a05:6820:4a0c:b0:660:e444:1098 with SMTP id 006d021491bc7-662f2174a23mr3237977eaf.80.1769647701832;
        Wed, 28 Jan 2026 16:48:21 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f9a18776sm2344023eaf.12.2026.01.28.16.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 16:48:21 -0800 (PST)
Message-ID: <3184a357-9f32-4023-9c15-d0b2fd502f4b@riscstar.com>
Date: Wed, 28 Jan 2026 18:48:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK
 and LDO regulators
To: Guodong Xu <guodong@riscstar.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Yixun Lan <dlan@gentoo.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
 <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
 <CAH1PCMYWFhR-Np0-yq40eWqJbTmFub4qop6Wq2gA2mUqbJrtdA@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMYWFhR-Np0-yq40eWqJbTmFub4qop6Wq2gA2mUqbJrtdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_164823_793461_F404BAB4 
X-CRM114-Status: GOOD (  34.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8yOC8yNiA5OjI2IEFNLCBHdW9kb25nIFh1IHdyb3RlOgo+IEhpLCBBbGV4CgpJJ20gZ29p
bmcgdG8ga2VlcCBhbGwgdGhpcyBjb250ZXh0LCBidXQgSSBoYXZlIGEgZmV3IGNvbW1lbnRzIGJl
bG93LgoKPiBPbiBXZWQsIEphbiAyOCwgMjAyNiBhdCA5OjI44oCvUE0gQWxleCBFbGRlciA8ZWxk
ZXJAcmlzY3N0YXIuY29tPiB3cm90ZToKPj4KPj4gT24gMS8yMy8yNiA2OjIwIFBNLCBHdW9kb25n
IFh1IHdyb3RlOgo+Pj4gSGlnaGVyIHZvbHRhZ2Ugc2V0dGluZ3Mgd2VyZSB1bnVzYWJsZSBkdWUg
dG8gaW5jb3JyZWN0IG5fdm9sdGFnZXMgdmFsdWVzCj4+PiBjYXVzaW5nIHJlZ2lzdHJhdGlvbiBm
YWlsdXJlcy4gRm9yIGV4YW1wbGUsIHNldHRpbmcgYWxkbzQgdG8gMy4zViBmYWlsZWQKPj4+IHdp
dGggLUVJTlZBTCBiZWNhdXNlIHRoZSByZXF1aXJlZCBzZWxlY3RvciAoMTIzKSBleGNlZWRlZCB0
aGUgYWxsb3dlZAo+Pj4gcmFuZ2UgKG5fdm9sdGFnZXM9MTE3KS4KPj4+Cj4+PiBGaXggYnkgYWxp
Z25pbmcgbl92b2x0YWdlcyB3aXRoIHRoZSBoYXJkd2FyZSByZWdpc3RlciB3aWR0aHMgcGVyIHRo
ZSBQMQo+Pj4gZGF0YXNoZWV0IFsxXToKPj4+IC0gQlVDSzogMjU1ICh3YXMgMjU0KSwgYWxsb3dz
IHNlbGVjdG9ycyAwLTI1NCwgc2VsZWN0b3IgMjU1IGlzIHJlc2VydmVkCj4+PiAtIExETzogMTI4
ICh3YXMgMTE3KSwgYWxsb3dzIHNlbGVjdG9ycyAwLTEyNywgc2VsZWN0b3JzIDAtMTAgYXJlIGZv
cgo+Pj4gICAgIHN1c3BlbmQgbW9kZSwgdmFsaWQgb3BlcmF0aW9uYWwgcmFuZ2UgaXMgMTEtMTI3
Cj4+Pgo+Pj4gVGhpcyBlbmFibGVzIHRoZSBmdWxsIHZvbHRhZ2UgcmFuZ2Ugc3VwcG9ydGVkIGJ5
IHRoZSBoYXJkd2FyZS4KPj4+Cj4+PiBGaXhlczogOGI4NGQ3MTJhZDg0ICgicmVndWxhdG9yOiBz
cGFjZW1pdDogc3VwcG9ydCBTcGFjZW1pVCBQMSByZWd1bGF0b3JzIikKPj4+IExpbms6IGh0dHBz
Oi8vZGV2ZWxvcGVyLnNwYWNlbWl0LmNvbS9kb2N1bWVudGF0aW9uIFsxXQo+Pj4gU2lnbmVkLW9m
Zi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4+PiAtLS0KPj4+IHYyOiBO
byBjaGFuZ2UuCj4+PiAtLS0KPj4+ICAgIGRyaXZlcnMvcmVndWxhdG9yL3NwYWNlbWl0LXAxLmMg
fCA2ICsrKy0tLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQt
cDEuYyBiL2RyaXZlcnMvcmVndWxhdG9yL3NwYWNlbWl0LXAxLmMKPj4+IGluZGV4IDJiZjkxMzdl
MTJiMS4uMmI1ODViYTAxYTkzIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9yZWd1bGF0b3Ivc3Bh
Y2VtaXQtcDEuYwo+Pj4gKysrIGIvZHJpdmVycy9yZWd1bGF0b3Ivc3BhY2VtaXQtcDEuYwo+Pj4g
QEAgLTg3LDEzICs4NywxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGxpbmVhcl9yYW5nZSBwMV9s
ZG9fcmFuZ2VzW10gPSB7Cj4+PiAgICAgICAgfQo+Pj4KPj4+ICAgICNkZWZpbmUgUDFfQlVDS19E
RVNDKF9uKSBcCj4+PiAtICAgICBQMV9SRUdfREVTQyhCVUNLLCBidWNrLCBfbiwgInZpbiIsIDB4
NDcsIEJVQ0tfTUFTSywgMjU0LCBwMV9idWNrX3JhbmdlcykKPj4+ICsgICAgIFAxX1JFR19ERVND
KEJVQ0ssIGJ1Y2ssIF9uLCAidmluIiwgMHg0NywgQlVDS19NQVNLLCAyNTUsIHAxX2J1Y2tfcmFu
Z2VzKQo+Pgo+PiBUaGlzIGlzIGNvcnJlY3QuICBUaGVyZSBhcmUgMjU1IHBvc3NpYmxlIHJhbmdl
cywgMC4uMjU0LCBhbmQKPj4gMjU1IGlzIGFuIGlsbGVnYWwgdmFsdWUuCj4+Cj4+IEkgdGhpbmsg
dGhpcyBidWcgaXMgYW4gYXJ0aWZhY3Qgb2YgYSBjaGFuZ2UgSSBtYWRlIHdoaWxlCj4+IGNoYXNp
bmcgYW4gaXNzdWUgZHVyaW5nIGRldmVsb3BtZW50LCBhbmQgSSBuZWdsZWN0ZWQgdG8KPj4gY2hh
bmdlIGl0IGJhY2suCj4+Cj4+IFRlY2huaWNhbGx5IHRoaXMgaXMgYSBidWcgZml4IGJ1dCBpdCBk
b2Vzbid0IG1hdHRlciBiZWNhdXNlCj4+IHRoaXMgdm9sdGFnZSB2YWx1ZSAoMjU1IHJlcHJlc2Vu
dHMgMy40NTAgdm9sdHMpIHdhcyBub3QKPj4gcmVxdWlyZWQuCj4+Cj4+PiAgICAjZGVmaW5lIFAx
X0FMRE9fREVTQyhfbikgXAo+Pj4gLSAgICAgUDFfUkVHX0RFU0MoQUxETywgYWxkbywgX24sICJ2
aW4iLCAweDViLCBMRE9fTUFTSywgMTE3LCBwMV9sZG9fcmFuZ2VzKQo+Pj4gKyAgICAgUDFfUkVH
X0RFU0MoQUxETywgYWxkbywgX24sICJ2aW4iLCAweDViLCBMRE9fTUFTSywgMTI4LCBwMV9sZG9f
cmFuZ2VzKQo+Pgo+PiBJIHdvdWxkIHNheSB0aGlzIGlzIG5vdCBjb3JyZWN0Lgo+Pgo+PiBUaGUg
dmFsaWQgcmFuZ2Ugb2YgdmFsdWVzIGluIHRoaXMgcmVnaXN0ZXIgaXMgMHhkLTB4MWYgKDExLTEy
NyksCj4+IHdoaWNoIGlzIDExNyB2YWx1ZXM7IDB4ZCByZXByZXNlbnRzIDAuNTAwViBhbmQgMHgx
ZiByZXByZXNlbnRzCj4+IDMuNDAwVi4KPj4KPj4gVGVjaG5pY2FsbHksIGFsbCBvdGhlciB2YWx1
ZXMgcmVwcmVzZW50IDAuNXYgKGFuZCBjb3VsZCB0aGVyZWZvcmUKPj4gYmUgY29uc2lkZXJlZCB2
YWxpZCksIGJ1dCBJIGJlbGlldmUgdGhvc2Ugc2hvdWxkIG5ldmVyIGJlIHVzZWQKPj4gYW5kIGlu
dGVudGlvbmFsbHkgY29uc2lkZXJlZCB0aGVtIGludmFsaWQuICBJZiAwLjVWIGlzIGRlc2lyZWQs
Cj4+IDB4ZCBzaG91bGQgYmUgdXNlZC4KPj4KPj4gRG8geW91IGRpc2FncmVlIHdpdGggdGhpcz8K
PiAKPiBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuIGFib3V0IHNlbGVjdG9ycyAwLTEwLiBIb3dl
dmVyLCBtYXliZSB5b3UgbWlzc2VkCj4gdGhpcyBwYXJ0Ogo+IAo+IENvZGUgc25pcHBldCBmcm9t
IHRoZSBjIGZpbGUsIExpbmUgNTM6Cj4gKFRoZSBwMV9idWNrX3JhbmdlcyBhbmQgcDFfbGRvX3Jh
bmdlcyBhcmUgZGVmaW5lZCBjb3JyZWN0bHkuKQo+IAo+IC8qIFNlbGVjdG9yIHZhbHVlIDI1NSBj
YW4gYmUgdXNlZCB0byBkaXNhYmxlIHRoZSBidWNrIGNvbnZlcnRlciBvbiBzbGVlcCAqLwo+IHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbGluZWFyX3JhbmdlIHAxX2J1Y2tfcmFuZ2VzW10gPSB7Cj4gUkVH
VUxBVE9SX0xJTkVBUl9SQU5HRSg1MDAwMDAsIDAsIDE3MCwgNTAwMCksCj4gUkVHVUxBVE9SX0xJ
TkVBUl9SQU5HRSgxMzc1MDAwLCAxNzEsIDI1NCwgMjUwMDApLAo+IH07Cj4gCj4gLyogU2VsZWN0
b3IgdmFsdWUgMCBjYW4gYmUgdXNlZCBmb3Igc3VzcGVuZCAqLwo+IHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbGluZWFyX3JhbmdlIHAxX2xkb19yYW5nZXNbXSA9IHsKPiBSRUdVTEFUT1JfTElORUFSX1JB
TkdFKDUwMDAwMCwgMTEsIDEyNywgMjUwMDApLAo+IH07Cj4gCj4gLmxpbmVhcl9yYW5nZSwgdGhl
IG51bWJlciBvZiB2YWxpZCB2b2x0YWdlIHN0ZXBzIChzZWxlY3RvcnMgMTEtMTI3KQo+IC5uX3Zv
bHRhZ2VzIGZpZWxkLCB3aGljaCBkZWZpbmVzIHRoZSBzZWxlY3RvciBuYW1lc3BhY2UgKDAgdG8g
MTcwLCB0aGVuIHRvIDI1NCkKCkkgdGhpbmsgeW91IG1lYW4gMTE3LCBub3QgMTcwLiAgSSBkb24n
dCB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4Kd2l0aCAidGhlbiB0byAyNTQuIgoKSW4gYW55IGNh
c2UuLi4gIHlvdSBhbmQgSSB0YWxrZWQgb2ZmbGluZSBhbmQgSSBub3cgYWNjZXB0IHRoYXQsCmlu
IG9yZGVyIHRvIGFsbG93IHNlbGVjdG9yIHZhbHVlcyB1cCB0aHJvdWdoIDEyNywgdGhlIHZhbHVl
IG9mCnJlZ3VsYXRvcl9kZXNjLT5uX3ZvbHRhZ2VzIG5lZWRzIHRvIGJlIDEyOCAob3IgY29uY2Vp
dmFibHksCjI1NikuCgpUaGlzIGlzIHNob3duIGluIG51bWVyb3VzIHBsYWNlcywgd2l0aCB0aGlu
Z3MgbGlrZToKCiAgICAgICAgIGlmIChzZWxlY3RvciA+PSBkZXNjLT5uX3ZvbHRhZ2VzKQogICAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKICAgICAgICAgaWYgKHNlbGVjdG9yIDwgZGVz
Yy0+bGluZWFyX21pbl9zZWwpCiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7CgpJbiA8bGludXgv
cmVndWxhdG9yL2RyaXZlci5oPiBpdCBzdGF0ZXMgIlNlbGVjdG9ycyByYW5nZSBmcm9tCnplcm8g
dG8gb25lIGxlc3MgdGhhbiByZWd1bGF0b3JfZGVzYy5uX3ZvbHRhZ2VzIiBidXQgaXQgYWxzbwpz
YXlzIG5fdm9sdGFnZXMgaXMgdGhlICJOdW1iZXIgb2Ygc2VsZWN0b3JzIGF2YWlsYWJsZSBmb3IK
b3BzLmxpc3Rfdm9sdGFnZSgpLiIKClRoZSBmb3JtZXIgbWVhbmluZyBpcyByZWFsbHkgYWJvdXQg
YWxsIHBvc3NpYmxlIHZhbHVlcyB0aGF0CmNhbiBiZSBzdG9yZWQgaW4gYSBzZWxlY3RvciByZWdp
c3RlciAoZmllbGQpLS13aGV0aGVyIHRob3NlCnZhbHVlcyBhcmUgdmFsaWQgc2VsZWN0b3JzIG9y
IG5vdC4gIFdoaWxlIHRoZSBsYXR0ZXIgZGVzY3JpcHRpb24Kc291bmRzIHRvIG1lIGxpa2UgdGhl
IHNpemUgb2YgYW4gYXJyYXkuICBXZSBoYXZlIGEgY2FzZSB3aGVyZQpzb21lIHZhbHVlcyAoMC4u
MTAgYW5kIDEyOC4uMjU1KSBkb24ndCByZWFsbHkgZml0ICh0aGV5IGFsbApyZXByZXNlbnQgdmFs
dWUgMC41IHZvbHRzLCB3aGlsZSAxMS4uMTI3IHJlcHJlc2VudCBhIGxpbmVhcgpyYW5nZSkuICBB
bmQgSSB3YXMgdGhpbmtpbmcgbl92b2x0YWdlcyB3YXMgMTE3ICh0aGUgc2l6ZSBvZgp0aGUgYXJy
YXkpLCByYXRoZXIgdGhhbiAxMjggKG9uZSBtb3JlIHRoYW4gdGhlIG1heGltdW0KdmFsaWQgc2Vs
ZWN0b3IgdmFsdWUpLgoKSW4gYW55IGNhc2UsIHNvbWUgb2YgdGhpcyBzZWVtcyBsZXNzIGNsZWFy
IHRoYW4gaXQgY291bGQgYmUuCgpCdXQgSSdtIG5vdCBnb2luZyB0byBnZXQgaW4gdGhlIHdheSBv
ZiB5b3VyIHBhdGNoIGJlaW5nCmFjY2VwdGVkLgoKUmV2aWV3ZWQtYnk6IEFsZXggRWxkZXIgPGVs
ZGVyQHJpc2NzdGFyLmNvbT4KCgoKCj4gV2l0aCBuX3ZvbHRhZ2VzID0gMTE3LCB0aGUgbWF4aW11
bSBhY2Nlc3NpYmxlIHNlbGVjdG9yIGlzIDExNi4gVGhpcyBtYWtlcwo+IHNlbGVjdG9ycyAxMTct
MTI3IHVucmVhY2hhYmxlLCBldmVuIHRob3VnaCB0aGV5J3JlIGRlZmluZWQgaW4gdGhlIGxpbmVh
cl9yYW5nZS4KPiAKPiBuX3ZvbHRhZ2VzID0gMTI4IGRvZXNuJ3QgZW5hYmxlIHRob3NlIGZvciBv
cGVyYXRpb25hbCB1c2UsIGl0IGp1c3QgYWxsb3dzCj4gdGhlIGZ1bGwgdmFsaWQgcmFuZ2UgKDEx
LTEyNykgdG8gYmUgYWNjZXNzaWJsZS4KPiAKPiBUaGlzIGlzIHdoeSBpbiBteSB0ZXN0IGZvciB0
aGUgSzMgcGljbyBib2FyZCwgc2V0dGluZyBBTERPIHRvIDMuM1YKPiAoc2VsZWN0b3IgMTIzKSBv
ciAzLjRWIChzZWxlY3RvciAxMjcpIGZhaWxzIHdpdGggdGhlIGN1cnJlbnQgY29kZS4KPiBJIG1l
YW4gdGhhdCBsZWFkcyBtZSB0byB0aGlzIGJ1ZyBmaXguCj4gCj4gQmVzdCByZWdhcmRzLAo+IEd1
b2RvbmcgWHUKPiAKPiAKPj4+ICAgICNkZWZpbmUgUDFfRExET19ERVNDKF9uKSBcCj4+PiAtICAg
ICBQMV9SRUdfREVTQyhETERPLCBkbGRvLCBfbiwgImJ1Y2s1IiwgMHg2NywgTERPX01BU0ssIDEx
NywgcDFfbGRvX3JhbmdlcykKPj4+ICsgICAgIFAxX1JFR19ERVNDKERMRE8sIGRsZG8sIF9uLCAi
YnVjazUiLCAweDY3LCBMRE9fTUFTSywgMTI4LCBwMV9sZG9fcmFuZ2VzKQo+Pj4KPj4+ICAgIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVndWxhdG9yX2Rlc2MgcDFfcmVndWxhdG9yX2Rlc2NbXSA9IHsK
Pj4+ICAgICAgICBQMV9CVUNLX0RFU0MoMSksCj4+Pgo+Pgo+PiBJIGhhdmUgZXhhY3RseSB0aGUg
c2FtZSBjb21tZW50IGFib3V0IHRoaXMgY2hhbmdlIHRvIHRoZQo+PiBudW1iZXIgb2Ygc3VwcG9y
dGVkIHZhbHVlcy4KPj4KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtQWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
