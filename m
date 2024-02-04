Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6C0C4828F
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Feb 2024 00:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C20mZgRwHxzoAoHb6rEtVWomvKGse/ijGxNqFhB0fTg=; b=N7PkfrQEYi+06G
	MX5lnssFEkjLTRRa77ftOXP7uPzkyVlBVY56wT3nsqfRaUKp8IRzYHUPfD93z+xnohtux1RChTfRN
	T0kuZruIcY9+stpiyeccnRQiNTQ+bHhdauEgu9pq+lCHn1Yqk4sIH2MvKbq5hOjM8cmSdbdWcaPtE
	maOmsPunCCAt+wRYS8YJvkctUi2+LkLqDrjkzLreYEGOLXKSiEPTTd9Q32iTSyoINgS8H0l2Lb/t2
	Wmf4jAQq84C4da/bpajOocFMPNyTDiAHDlTJcqF3NcHg1sWMLhbWIknBH9NJKnRWvPm7LUNrOyhVw
	4fqkSN0XQL0HWMMGql7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWQHT-0000000HRPG-0f3d;
	Sun, 04 Feb 2024 00:22:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWQHP-0000000HROo-31dX
	for linux-riscv@lists.infradead.org;
	Sun, 04 Feb 2024 00:22:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40efcb37373so29925215e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 03 Feb 2024 16:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1707006156; x=1707610956; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfmI2ewltHRJMYO5mo5fFwZc+1SV7LuHqUomT5kdRyc=;
        b=mUbSNYJu2Z8H1iSsVyPDt55r6nqan6BOFYCRIdTuPDJPiZfqWeNylhBIgUty3vEucb
         NuincT4iJTQOlAfatexFTIjnTSb01JxB4otnVeiiaq8IYaI+c7KPrglVARdAuV8a8CAk
         ey9fZE5sa0x0Mtb15F14UGJ7jrP5rV/NI4t98K9pusBJKWoQofLh98Mt81EiMVC2BmUa
         f8GX5frjHKjnnCfcR/4WDLeWpYODwM0sVzybF+aqC2fxY2Dhwhai7UTOAx3Q5e7e2N8Q
         G7tKIsegLRDeWhF9XxfWCr9yKCFH3wdNzcHe1it9K6eeVPGU2ESfENjg1KhEJ/t2G6NN
         /6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707006156; x=1707610956;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfmI2ewltHRJMYO5mo5fFwZc+1SV7LuHqUomT5kdRyc=;
        b=FQvc8dwrHNPCOoa99yEsEJWqv+kfysF+oEJwyiwU7lMRitmfY9T9CR0Mfpc7PnfVIa
         ZMPvrBlO5S/kOvn6+q/IR6BNxLg2P6XCTd2AVmnoF7McPRmq6DRvd7YTgUybzLZ1zIku
         DUIidVwgQ03QyycLWeMeCnwYHRYZgnim4tJN3cJEJRs9GpqONeaWvF6e5OhRYsNtlJIT
         25mgzZncs/KXH+ZCQWMs98apZ5DTQSw2WX/wQYqVUrZcogWj5SKVj+/sBN1uncOxkDER
         PHgQvn8KK9qujSG66/xG8oZahNuJ2HBYIS+J6gtOtsyONh0N/e+Rl9vmnG7KtG2U8caa
         ncaA==
X-Gm-Message-State: AOJu0YzgnsXv9fGtfCP7n9eYSX2e+M+cTFsypuX3bSbl8AtAtpwoSn5h
	XjzjLyPdRJdfGOdqaRMlHK2Dtb8tbVLBPvz2n8lehDRsp5mOA9LjCZNzEUD6mU0=
X-Google-Smtp-Source: AGHT+IHTi3m2btatPb8/FQEFneiCu7KlySBWkA0Ujl2vPiUvGEgjbz/Z9LiAEEo14cV/np8nHj9OcA==
X-Received: by 2002:a05:600c:458a:b0:40f:d3bd:b222 with SMTP id r10-20020a05600c458a00b0040fd3bdb222mr1413414wmo.38.1707006156368;
        Sat, 03 Feb 2024 16:22:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWJTmKxGNH/ofKVvL73KTRZlg0mpziW2SONM+lih4pUDUXze0Pudw4a1sccT9ryZqBsoL7pFDIP7gcQG0h5kprVUqwPZsmtyd5/4WCR9wwSbK3d96ikGt21oE2QcjHfIkB8j1I++xn65wWXI3HgsSzY2E7+unG4QFRBDvUWgdkoEgn18caH8K5iO++HQ+Gve8TcUqqvvFKIYSyldA7JaAaM0erFh+AEoihv47VtdWvnsNsqKesxAmoZrybLyOF0+DjlLFl3N3IZKOcMXRl92deUuotAozXDEx9j2NCMTGo9hbImGql1w8U6m59XC9rt+l3xwfdg6BvgSXED10Qmcw2RvtKjfeYQ
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c358400b0040fb7c87c73sm4250081wmq.45.2024.02.03.16.22.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Feb 2024 16:22:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH] riscv: hwprobe: export VA_BITS
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <5657c211-531b-4890-8c52-182b7b4eae7c@app.fastmail.com>
Date: Sun, 4 Feb 2024 00:22:25 +0000
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel@vger.kernel.org,
 Robin Ehn <rehn@rivosinc.com>
Message-Id: <5A2420B9-6039-445B-B2C3-77F13EDD77BA@jrtc27.com>
References: <20240201140319.360088-1-cleger@rivosinc.com>
 <ZbxUUsKdKIPI8Fb/@ghost> <701d3350-93d3-4235-aaf7-04c6492420a7@rivosinc.com>
 <5657c211-531b-4890-8c52-182b7b4eae7c@app.fastmail.com>
To: Stefan O'Rear <sorear@fastmail.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_162239_798332_6BC713B5 
X-CRM114-Status: GOOD (  24.85  )
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

T24gMyBGZWIgMjAyNCwgYXQgMTA6NDAsIFN0ZWZhbiBPJ1JlYXIgPHNvcmVhckBmYXN0bWFpbC5j
b20+IHdyb3RlOgo+IAo+IE9uIEZyaSwgRmViIDIsIDIwMjQsIGF0IDM6MjIgQU0sIENsw6ltZW50
IEzDqWdlciB3cm90ZToKPj4gT24gMDIvMDIvMjAyNCAwMzozMiwgQ2hhcmxpZSBKZW5raW5zIHdy
b3RlOgo+Pj4gT24gVGh1LCBGZWIgMDEsIDIwMjQgYXQgMDM6MDI6NDVQTSArMDEwMCwgQ2zDqW1l
bnQgTMOpZ2VyIHdyb3RlOgo+Pj4+IFNvbWUgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyAoT3BlbkpE
SyBmb3IgaW5zdGFuY2UpIHVzZXMgdGhlIGZyZWUgYml0cwo+Pj4+IGluIHBvaW50ZXJzIHRvIGlu
c2VydCBhZGRpdGlvbmFsIGluZm9ybWF0aW9uIGZvciB0aGVpciBvd24gbG9naWMuCj4+Pj4gQ3Vy
cmVudGx5IHRoZXkgcmVseSBvbiBwYXJzaW5nIC9wcm9jL2NwdWluZm8gdG8gb2J0YWluIHRoZSBj
dXJyZW50IHZhbHVlCj4+Pj4gb2YgdmlydHVhbCBhZGRyZXNzIHVzZWQgYml0cyBbMV0uIEV4cG9y
dGluZyBWQV9CSVRTIHRocm91Z2ggaHdwcm9iZSB3aWxsCj4+Pj4gYWxsb3cgZm9yIGEgbW9yZSBz
dGFibGUgaW50ZXJmYWNlIHRvIGJlIHVzZWQuCj4+PiAKPj4+IG1tYXAgYWxyZWFkeSBzdXBwb3J0
cyB0aGlzIHdpdGhvdXQgYSBuZWVkIGZvciBhcHBsaWNhdGlvbnMgdG8ga25vdyB0aGUKPj4+IHVu
ZGVybHlpbmcgaGFyZHdhcmUuIElmIGEgaGludCBhZGRyZXNzIGlzIHBhc3NlZCBpbnRvIG1tYXAs
IGl0IHdpbGwgbmV2ZXIKPj4+IHJldHVybiBhbiBhZGRyZXNzIHRoYXQgdXNlcyBtb3JlIGJpdHMg
dGhhbiB0aGUgaGludCBhZGRyZXNzLiBJIGRlc2lnbmVkCj4+PiBpdCB0aGF0IHdheSBzbyB0aGF0
IHNvbWV0aGluZyBsaWtlIHRoaXMgd2Fzbid0IG5lY2Vzc2FyeS4KPj4gCj4+IE9rIGV2ZW4gdGhv
dWdoIHByb2JpbmcgdGhpcyBraW5kIG9mIHRoaW5nIGlzIHByb2JhYmx5IG5vdCB3aGF0IG1tYXAg
aXMKPj4gbWVhbnQgdG8gZG8uIElNSE8sIHByb2JpbmcgdGhpcyB0aHJvdWdoIHRoZSByZWd1bGFy
IGh3cHJvYmUgaW50ZXJmYWNlIGlzCj4+IHByb2JhYmx5IG1vcmUgY29oZXJlbnQgYnV0IG1heWJl
IFJvYmluICh3aGljaCBuZWVkcyB0aGlzIGluZm9ybWF0aW9uKQo+PiBjYW4gcmVseSBvbiB0aGF0
Lgo+IAo+IEJvdGggb2YgdGhlc2UgYXJlIHVzZWZ1bCwgc2VwYXJhdGVseSBhbmQgaW4gY29uanVu
Y3Rpb24uCj4gCj4gaHdwcm9iZSBhbGxvd3MgYXBwbGljYXRpb25zIHdoaWNoIGNhbiBhZGFwdCB0
byBkaWZmZXJlbnQgVkEgc2l6ZXMgdG8gbGVhcm4KPiB3aGljaCBpcyBpbiB1c2UgcHJpb3IgdG8g
YWxsb2NhdGluZyBtZW1vcnkuCj4gCj4gbW1hcCBoaW50cyBhbGxvdyBhcHBsaWNhdGlvbnMgd2hp
Y2ggcmVxdWlyZSBhIGZpeGVkIGxpbWl0IG9uIHRoZSBWQSBzaXplIHRvCj4gZXhwcmVzcyB0aGF0
IGxpbWl0IGF0IHRoZSBwb2ludCBvZiByZXF1aXJlbWVudCwgdGhlIGhpbnQgY2FuIGJlIHNldCBi
YXNlZCBvbgo+IHRoZSBod3Byb2JlIHJlc3VsdCB0byBleHBsaWNpdGx5IGluZGljYXRlIGl0cyB1
c2UuCgpOZWl0aGVyIGlzIGFuIGFyY2hpdGVjdHVyZS1zcGVjaWZpYyBjb25jZXB0IHRob3VnaC4g
SWYgeW91IHdhbnQgdG8KZXhwb3NlIGEgbm90aW9uIG9mIFZBIGJpdHMgdG8gdXNlcnNwYWNlIHRo
ZW4gaXQgc2hvdWxkIHByb2JhYmx5IGJlIGRvbmUKaW4gYSBtb3JlIGdlbmVyaWMgbWFubmVyIHRo
YW4gdGhlIFJJU0MtVi1zcGVjaWZpYyBod3Byb2JlIHN5c2NhbGwsCnByb2JhYmx5IGFzIHR3byBu
dW1iZXJzLCBsb3cgYW5kIGhpZ2ggYml0cyAoaWE2NOKAmXMgcmVnaW9ucyBtYXkgYmUgZ29uZSwK
YnV0IHNwYXJjNjQgc3RpbGwgaGFzIGJvdGggaGFsdmVzIG9mIHRoZSBhZGRyZXNzIHNwYWNlIHBy
ZXNlbnRlZCB0bwp1c2Vyc3BhY2UsIHdpdGggdGhlIHN0YWNrIGluIGhpZ2gvbmVnYXRpdmUgbWVt
b3J5KS4KCkplc3MKCj4gLXMKPiAKPj4gQ2zDqW1lbnQKPj4gCj4+PiAKPj4+IC0gQ2hhcmxpZQo+
Pj4gCj4+Pj4gCj4+Pj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL29wZW5qZGsvamRrL2Jsb2Iv
bWFzdGVyL3NyYy9ob3RzcG90L29zX2NwdS9saW51eF9yaXNjdi92bV92ZXJzaW9uX2xpbnV4X3Jp
c2N2LmNwcCNMMTcxIFsxXQo+Pj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KPj4+PiAKPj4+PiAtLS0KPj4+PiBEb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QgIHwgMyArKysKPj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
cHJvYmUuaCAgICAgIHwgMiArLQo+Pj4+IGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3By
b2JlLmggfCAxICsKPj4+PiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwg
MyArKysKPj4+PiA0IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9i
ZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPj4+PiBpbmRleCBi
MmJjYzllZWQ5YWEuLjZmMTk4YzZlZDRmMCAxMDA2NDQKPj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlz
Y3YvaHdwcm9iZS5yc3QKPj4+PiBAQCAtMjEwLDMgKzIxMCw2IEBAIFRoZSBmb2xsb3dpbmcga2V5
cyBhcmUgZGVmaW5lZDoKPj4+PiAKPj4+PiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9a
SUNCT1pfQkxPQ0tfU0laRWA6IEFuIHVuc2lnbmVkIGludCB3aGljaAo+Pj4+ICAgcmVwcmVzZW50
cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96IGJsb2NrIGluIGJ5dGVzLgo+Pj4+ICsKPj4+PiArKiA6
YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfVkFfQklUU2A6IEFuIHVuc2lnbmVkIGxvbmcgd2hp
Y2gKPj4+PiArICByZXByZXNlbnQgdGhlIG51bWJlciBvZiBiaXRzIHVzZWQgdG8gc3RvcmUgdmly
dHVhbCBhZGRyZXNzZXMuCj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPj4+PiBpbmRleCA2
MzA1MDdkZmY1ZWEuLjE1MGE5ODc3YjBhZiAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3cHJvYmUuaAo+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdw
cm9iZS5oCj4+Pj4gQEAgLTgsNyArOCw3IEBACj4+Pj4gCj4+Pj4gI2luY2x1ZGUgPHVhcGkvYXNt
L2h3cHJvYmUuaD4KPj4+PiAKPj4+PiAtI2RlZmluZSBSSVNDVl9IV1BST0JFX01BWF9LRVkgNgo+
Pj4+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA3Cj4+Pj4gCj4+Pj4gc3RhdGljIGlu
bGluZSBib29sIHJpc2N2X2h3cHJvYmVfa2V5X2lzX3ZhbGlkKF9fczY0IGtleSkKPj4+PiB7Cj4+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4+Pj4gaW5kZXggOWYyYThlM2Zm
MjA0Li4yYTUwMDZjZGRiN2IgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaAo+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9o
d3Byb2JlLmgKPj4+PiBAQCAtNjcsNiArNjcsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4+
Pj4gI2RlZmluZSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURUQgKDQgPDwgMCkK
Pj4+PiAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9NQVNLICg3IDw8IDApCj4+Pj4g
I2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRSA2Cj4+Pj4gKyNkZWZp
bmUgUklTQ1ZfSFdQUk9CRV9LRVlfVkFfQklUUyA3Cj4+Pj4gLyogSW5jcmVhc2UgUklTQ1ZfSFdQ
Uk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+Pj4+IAo+Pj4+IC8qIEZsYWdzICov
Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4+Pj4gaW5kZXggYTdjNTZiNDFlZmQyLi4zMjg0
MzU4MzZlMzYgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUu
Ywo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPj4+PiBAQCAtMjAy
LDYgKzIwMiw5IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfb25lX3BhaXIoc3RydWN0IHJpc2N2X2h3
cHJvYmUgKnBhaXIsCj4+Pj4gaWYgKGh3cHJvYmVfZXh0MF9oYXMoY3B1cywgUklTQ1ZfSFdQUk9C
RV9FWFRfWklDQk9aKSkKPj4+PiBwYWlyLT52YWx1ZSA9IHJpc2N2X2Nib3pfYmxvY2tfc2l6ZTsK
Pj4+PiBicmVhazsKPj4+PiArIGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfVkFfQklUUzoKPj4+PiAr
IHBhaXItPnZhbHVlID0gVkFfQklUUzsKPj4+PiArIGJyZWFrOwo+Pj4+IAo+Pj4+IC8qCj4+Pj4g
ICogRm9yIGZvcndhcmQgY29tcGF0aWJpbGl0eSwgdW5rbm93biBrZXlzIGRvbid0IGZhaWwgdGhl
IHdob2xlCj4+Pj4gLS0gCj4+Pj4gMi40My4wCj4+Pj4gCj4+Pj4gCj4+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKPj4+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+PiAKPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
