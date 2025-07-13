Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF896C83F20
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jul 2025 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGWgjoWSU8sVb9n2saiNwDRhQ4UlpTgSL2TOpFfa74k=; b=rijIqu+fMP1m4g
	lsxPkqLD9vFqyZlkfcW7E4Xiyh+sTDu+g1Txybw9Sfp4zeXFRiOiOC0jb8VvEhUCdMvFLj5JOLBj4
	VPYiaB+bnFP952rKqbnUf4jUK46EkNe+MJzOHi+2+sLbT2CLvcEAwEhV+WPMdecYWqwFPT1cGyHIi
	BIJ2CKWMofXBImD4fmx5lf3d6lR3yXST8qAs+BboFY/ODh0Kd9JPTM3p9rtQOrsQNBVEytBOnwPpo
	CfgQKz4GIlVIUkYvNgm9ZwyiZl1y1EoL8rfwBJ7UCZ11mcVeQxIVTuRxIYmAaVdXCDRmQMaKSQBTp
	pfoCd8uhwBIQsLolMwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazvY-00000000PJf-3PBE;
	Sun, 13 Jul 2025 16:51:48 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazt1-00000000P6l-25Ma
	for linux-riscv@lists.infradead.org;
	Sun, 13 Jul 2025 16:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752425346; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c7MZevP3sKW018gKsWxOJeNgAaXx7fdFn5HXYJv1SepzHzM9aTHYQ9ueEUfHp7Wonmh+dHBvlI3RJIfFpF3Fww/2LYhs6zCwEn1ct9ySZyvYH8cFtInxufyuYgxKOYIbmrETzaFRWQfp86AafdgIDfy8alc6HR+0Bt27Zymb8Yc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752425346; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rjQcOjdpmHK6mcrEnsIMoe5s+xZNboblDGM+pP9AkVc=; 
	b=Sf1jeh++32agAO8glEe3BMz/0tx0hE2nHIZZ1RSAX7cEcBPjMwUC6OTgmrxKema5wxW+Btl0SZ/npVsBpolzXCVCUQrj15BqLFeYsAotr/YtUtPgZhkBNqm3NCP8BOW5Qfl1WLEkZBuehtIKfqHiWI3C8I5wUpUWS31dk3Ia8wE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752425346;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=rjQcOjdpmHK6mcrEnsIMoe5s+xZNboblDGM+pP9AkVc=;
	b=D79b8Dc4y66g5Nh/b08lMEgR758ic0VQ5UuqHkJ15B5D+Wv0I7zD2lnW5BBDAyAX
	Iz6fF0wJKaBjvg3Aj0KwKXxDguKIFaadxZtUh4tvj1QVfl0TVdZGonh+unlfwPxZH9E
	zcascARpbwEtZgCCW/XF9ho61xMK8k4aQ95wQhKI=
Received: by mx.zohomail.com with SMTPS id 175242533137147.170436231877716;
	Sun, 13 Jul 2025 09:48:51 -0700 (PDT)
Message-ID: <776638cc-cbd9-4747-82eb-e11bcc6c8bdd@zohomail.com>
Date: Mon, 14 Jul 2025 00:48:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] riscv: canaan: Add support for K230-Canmv clock
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
Feedback-ID: rr08011227880f38caa1930ad1c9b780930000faaf536ef634abd61e4f6519b99c87b19288cacb14dd802076:zu08011227e2968d9b4ed54629e843bd360000cb99e0991875710b13ecb368d541820e68b7cad0360fbc2f1a:rf0801122d3a7a9663a8acbc1f2172599900004c3708170fa28df8c0b3ab9b75822793432367716206bb0a8d6cbcdbe80463:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_094911_963029_E9A9DC8D 
X-CRM114-Status: GOOD (  19.82  )
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

Ck9uIDIwMjUvNC8xNSAyMjoyNSwgWHVrYWkgV2FuZyB3cm90ZToKPiBUaGlzIHBhdGNoIHNlcmll
cyBhZGRzIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgdGhlIENhbmFhbiBLZW5kcnl0ZQo+
IEsyMzAgU29DLiBUaGUgSzIzMCBTb0MgaW5jbHVkZXMgYW4gZXh0ZXJuYWwgMjRNSHogT1NDIGFu
ZCA0IGludGVybmFsCj4gUExMcywgd2l0aCB0aGUgY29udHJvbGxlciBtYW5hZ2luZyB0aGVzZSBz
b3VyY2VzIGFuZCB0aGVpciBkZXJpdmVkIGNsb2Nrcy4KPgo+IFRoZSBjbG9jayB0cmVlIGFuZCBo
YXJkd2FyZS1zcGVjaWZpYyBkZWZpbml0aW9uIGNhbiBiZSBmb3VuZCBpbiB0aGUKPiB2ZW5kb3In
cyBEVFMgWzFdLAo+IGFuZCB0aGlzIHNlcmllcyBpcyBiYXNlZCBvbiB0aGUgSzIzMCBpbml0aWFs
IHNlcmllcyBbMl0uCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcnV5aXNkay9saW51eC14
dWFudGllLWtlcm5lbC9ibG9iL2xpbnV4LTYuNi4zNi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFh
bi9rMjMwX2Nsb2NrX3Byb3ZpZGVyLmR0c2kgWzFdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtY2xrL3RlbmNlbnRfRjc2RUI4RDczMUM1MjFDMThENUQ3QzRGODIyOURBQTU4
RTA4QHFxLmNvbS8gWzJdCj4KPiBDby1kZXZlbG9wZWQtYnk6IFRyb3kgTWl0Y2hlbGwgPFRyb3lN
aXRjaGVsbDk4OEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVHJveSBNaXRjaGVsbCA8VHJv
eU1pdGNoZWxsOTg4QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBYdWthaSBXYW5nIDxraW5n
eHVrYWlAem9ob21haWwuY29tPgo+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NjoKPiAtIFJlbW92ZSBz
b21lIHJlZHVuZGFudCBjb21tZW50cyBpbiBzdHJ1Y3QgZGVjbGFyYXRpb24uCj4gLSBSZXBsYWNl
IHRoZSBWZW5kb3IncyBjb2RlIHNvdXJjZSBsaW5rIHdpdGggYSBuZXcgb25lLgo+IC0gTGluayB0
byB2NTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDMyMC1iNC1rMjMwLWNsay12NS0w
LTBlOWQwODljNTQ4OEB6b2hvbWFpbC5jb20KPgo+IENoYW5nZXMgaW4gdjU6Cj4gLSBGaXggaW5j
b3JyZWN0IGJhc2UtY29tbWl0IGFuZCBhZGQgcHJlcmVxdWlzaXRlLXBhdGNoLWlkLgo+IC0gUmVw
bGFjZSBkdW1teSBhcGJfY2xrIHdpdGggcmVhbCBvbmVzIGZvciBVQVJUcy4KPiAtIEFkZCBJRHMg
b2YgVUFSVHMgY2xvY2sgYW5kIERNQSBjbG9ja3MgaW4gdGhlIGJpbmRpbmcgaGVhZGVyLgo+IC0g
UmVwbGFjZSBrMjMwX2Nsa19jZmdzW10gYXJyYXkgd2l0aCBjb3JyZXNwb25kaW5nIG5hbWVkIHZh
cmlhYmxlcy4KPiAtIFJlbW92ZSBzb21lIHJlZHVuZGFudCBjaGVja3MgaW4gY2xrX29wcy4KPiAt
IERyb3AgdGhlIHVubmVjZXNzYXJ5IHBhcmVudGhlc2lzIGFuZCB0eXBlIGNhc3RzLgo+IC0gTW9k
aWZ5IHJldHVybiB2YWx1ZSBoYW5kbGluZyBpbiBwcm9iZSBwYXRoIHRvIGF2b2lkIHJlZHVuZGFu
dCBwcmludC4KPiAtIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAy
MTctYjQtazIzMC1jbGstdjQtMC01YTk1YTM0NTg2OTFAem9ob21haWwuY29tCj4KPiBDaGFuZ2Vz
IGluIHY0Ogo+IC0gUmVtb3ZlIHJlZHVuZGFudCBvbmVjZWxsX2dldCBjYWxsYmFjayBhbmQgYWRk
X3Byb3ZpZGVyIGZ1bmN0aW9uCj4gZm9yIHBsbF9kaXZzLgo+IC0gTW9kaWZ5IHRoZSBiYXNlLWNv
bW1pdCBpbiBjb3ZlciBsZXR0ZXIuCj4gLSBMaW5rIHRvIHYzOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzIwMjUwMjAzLWI0LWsyMzAtY2xrLXYzLTAtMzYyYzc5MTI0NTcyQHpvaG9tYWlsLmNv
bQo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIFJlb3JkZXIgdGhlIGRlZmluYXRpb24gYW5kIGRlY2xh
cmF0aW9uIGluIGRyaXZlcnMgY29kZS4KPiAtIFJlb3JkZXIgdGhlIHByb3BlcnRpZXMgaW4gZHRz
IG5vZGUuCj4gLSBSZXBsYWNlIGdsb2JhbCB2YXJpYWJsZSBgazIzMF9zeXNjbGtgIHdpdGggZHlu
YW1pYyBtZW1vcnkgYWxsb2NhdGlvbi4KPiAtIFJlbmFtZSB0aGUgbWFjcm8gSzIzMF9OVU1fQ0xL
UyB0byBLMjMwX0NMS19OVU0uCj4gLSBVc2UgZGV2X2Vycl9wcm9iZSBmb3IgZXJyb3IgaGFuZGxp
bmcuCj4gLSBSZW1vdmUgdW51c2VkIGluY2x1ZGVzLgo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDI1MDEwOC1iNC1rMjMwLWNsay12Mi0wLTI3YjMwYTJjYTUyZEB6
b2hvbWFpbC5jb20KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBBZGQgaXRlbXMgYW5kIGRlc2NyaXB0
aW9uLgo+IC0gUmVuYW1lIGsyMzAtY2xrLmggdG8gY2FuYWFuLGsyMzAtY2xrLmgKPiAtIExpbmsg
dG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMjktYjQtazIzMC1jbGstdjEt
MC0yMjFhOTE3ZTgwZWRAem9ob21haWwuY29tCj4KPiAtLS0KPiBYdWthaSBXYW5nICgzKToKPiAg
ICAgICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBiaW5kaW5ncyBmb3IgQ2FuYWFuIEsyMzAgY2xv
Y2sgY29udHJvbGxlcgo+ICAgICAgIGNsazogY2FuYWFuOiBBZGQgY2xvY2sgZHJpdmVyIGZvciBD
YW5hYW4gSzIzMAo+ICAgICAgIHJpc2N2OiBkdHM6IGNhbmFhbjogQWRkIGNsb2NrIGRlZmluaXRp
b24gZm9yIEsyMzAKPgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jYW5hYW4sazIz
MC1jbGsueWFtbCB8ICAgNDMgKwo+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9rMjMwLmR0
c2kgICAgICAgICAgICAgICB8ICAgMjUgKy0KPiAgZHJpdmVycy9jbGsvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA2ICsKPiAgZHJpdmVycy9jbGsvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPiAgZHJpdmVycy9jbGsvY2xr
LWsyMzAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNzEwICsrKysrKysrKysrKysr
KysrKysrCj4gIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svY2FuYWFuLGsyMzAtY2xrLmggICAg
ICAgIHwgICA2OSArCj4gIDYgZmlsZXMgY2hhbmdlZCwgMTg0NiBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiAwZWVhOTg3MDg4YTIyZDczZDgxZTk2OGRl
NzM0N2NkYzdlNTk0ZjcyCj4gY2hhbmdlLWlkOiAyMDI0MTIwNi1iNC1rMjMwLWNsay05MjVmMzNm
ZWQ2YzIKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGRlZGEzYzQ3MmYwMDAwZmZkNDBjZGRkN2Nm
NmQzYjVlMmQ3ZGE3ZGMKPgo+IEJlc3QgcmVnYXJkcywKRGVhciBhbGwsCgpJJ20gd29ya2luZyBv
biBhIExpbnV4IGNsb2NrIGRyaXZlciBhbmQgaGF2ZSBlbmNvdW50ZXJlZCBhIHF1ZXN0aW9uCnJl
Z2FyZGluZyBob3cgdG8gcHJvcGVybHkgcmVwcmVzZW50IGEgcGFydGljdWxhciB0eXBlIG9mIGNs
b2NrIHNvdXJjZS4KCkluIEsyMzAgU29DLCB0aGVyZSdzIGEgbXV4IGNsb2NrIHdob3NlIHBhcmVu
dCBjYW4gb3B0aW9uYWxseSBiZSBhbgpleHRlcm5hbCBwdWxzZSBzaWduYWwsIHdoaWNoIGlzIGNv
dW50ZWQgdmlhIGEgcGluICh0aGUgaW5wdXQgaXMgbm90CmdlbmVyYXRlZCBpbnRlcm5hbGx5IGJ1
dCBjb21lcyBmcm9tIGFuIGV4dGVybmFsIHNvdXJjZSkuIEnigJltIHdvbmRlcmluZzoKClNob3Vs
ZCB0aGlzIGV4dGVybmFsIHB1bHNlIHNpZ25hbCBiZSBtb2RlbGVkIGFzIGEgY2xvY2sgd2l0aGlu
IHRoZQpDb21tb24gQ2xvY2sgRnJhbWV3b3JrIChDQ0YpPwoKSWYgc28sIHdoYXQgd291bGQgYmUg
dGhlIGNvcnJlY3Qgd2F5IHRvIHJlZ2lzdGVyIG9yIGRlc2NyaWJlIHN1Y2ggYQpjbG9jayBpbiB0
aGUgZHJpdmVyPwoKQW55IGd1aWRhbmNlIG9yIGV4YW1wbGVzIHdvdWxkIGJlIGdyZWF0bHkgYXBw
cmVjaWF0ZWQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
