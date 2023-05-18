Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB8AC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 02:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3Nh0EZx1s8EtgGTsdCJX3UI6KFlGrSpUXhEZsOag9E=; b=AR8CCUiERCCU5/
	NNPdj/l3PaFgnupU4PzlhGMeOU58Odh0aUls2umyUdZEyx5AJUP1svBx0AgV0ZZRCSIG04XpsAMBT
	S/xAkG+XgUE5yC9fewhVz2fVJbXZ4keoSDb3wPOOs6NwRsT+pbZf8JyFQQfusmE9g2rHswQbd1h8J
	ezAzKh7YUZZybvKGoyTNp0YTAPD308fRLw/uW7ThJu7JVoUPZCDucEivIlWAsgod2kjtxUMM0G0L/
	oYpCgdmvTqfqeKt5npWdoWwyaciOZp8qkmj//uaGheN4pkUoJanADURQcpqL7G+AaclNBpkix0jXM
	VhHYKNR8up2MyHoHfReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzTiD-00Bj5F-0l;
	Thu, 18 May 2023 02:49:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzTi9-00Bj3p-1W
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 02:49:51 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50b9ef67f35so2708092a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 17 May 2023 19:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684378186; x=1686970186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7liFIXx8tC5EuopqHF+4OZT7BnqM1nFKp7piVkw/qM=;
        b=GLLrnD3CmE0XvGT+JxYZ7cQgV+1xvzVZ3Txzfjp4d0gGxnjEpPejY1rn9MygPZ3+ZD
         I/V1uQlegefxNQba9jqi8ad8/5Yy9WkJQlhMQ6d0+huqeN5Gmbe9JxiubjKUtiEvaYX5
         Gdm/xO0LN8lv4Ht86D77Xs/pQYkwA6mnZZma92DQrRYjkGCuwiizsWB9/h3mUEyUlGjE
         G3UM6QEPAGQwJnQNWOjO/et4vCOjmS6O3gRh8jXFuQWCC56B/iaCunmXizBsm+LgCXqd
         WT3d6WMhuKJBqAyIOGMy/A04umW083VL+C1uTgcEkPDv1qVysbQbNm9SyUslkbQbDYMC
         i1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684378186; x=1686970186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7liFIXx8tC5EuopqHF+4OZT7BnqM1nFKp7piVkw/qM=;
        b=VqsNFL/tm8nalxUmNb/Zom3yeisEaS8Iu0iFklnCIiLJB91Bnk8LAWpBtDMCZvJw6P
         yp8xXdq+Q8zCFjKCjI5kiTMjjb0oVjQQDZ/0MdwPjnHE/BzkwJcXExxhdx+7Kec9/kqH
         bTrBE4uTbcpbZJ47pwjTu+Nvz9PNePH9Lnm7wxjEUTC3D2kQrAq/Kya30k+5jJzqWRCW
         XQeVop+JKySBnePKxSYmt+r37qC0dVkTucuJ/N19/cTeIXi2T8Nz9XfgSsweJfTXYY2w
         P1Hr9cgprjcXaxAMjyG+dW0/v55Pv3Kdfru2TjGhm0GDiSiBOXp0QnUlBZotIpE5FhO4
         QXSQ==
X-Gm-Message-State: AC+VfDwRRQNsWLJ3ZaG2Scwe8wg3agCCZlP1BAisRHhwqYWGA+6y57Ra
	uDxag4cgszUwqWkjwZCTjTTMHiEPREcBNokd5xM=
X-Google-Smtp-Source: ACHHUZ793GNNj1zvlruifdVIL05R5dyN2IJ6aEpAWbno+Q7MmGhMkY3LMcXR8PdR134IXAQrGeWXb+7Ql+x39U1c8z4=
X-Received: by 2002:a05:6402:749:b0:50b:d303:d2a4 with SMTP id
 p9-20020a056402074900b0050bd303d2a4mr4318229edy.27.1684378185524; Wed, 17 May
 2023 19:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230517034510.15639-1-zegao@tencent.com> <20230517034510.15639-3-zegao@tencent.com>
 <20230517232751.09126a6cec8786a954e54bcf@kernel.org>
In-Reply-To: <20230517232751.09126a6cec8786a954e54bcf@kernel.org>
From: Ze Gao <zegao2021@gmail.com>
Date: Thu, 18 May 2023 10:49:34 +0800
Message-ID: <CAD8CoPC5N9sNTsYof1ig_mExh9qZHY=FjMwNfqxc23N=q3J2HA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_194949_536301_D5A2997D 
X-CRM114-Status: GOOD (  27.21  )
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

R2xhZCB0byBoZWFyIHRoYXQsIGhvb3JheSEgIDopCgpUaGFua3MKWmUKCk9uIFdlZCwgTWF5IDE3
LCAyMDIzIGF0IDEwOjI34oCvUE0gTWFzYW1pIEhpcmFtYXRzdSA8bWhpcmFtYXRAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDE3IE1heSAyMDIzIDExOjQ1OjA3ICswODAwCj4gWmUgR2Fv
IDx6ZWdhbzIwMjFAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gQ3VycmVudCBpbXBsZW1lbnRhdGlv
biBjYWxscyBrcHJvYmUgcmVsYXRlZCBmdW5jdGlvbnMgYmVmb3JlIGRvaW5nCj4gPiBmdHJhY2Ug
cmVjdXJzaW9uIGNoZWNrIGluIGZwcm9iZV9rcHJvYmVfaGFuZGxlciwgd2hpY2ggb3BlbnMgZG9v
cgo+ID4gdG8ga2VybmVsIGNyYXNoIGR1ZSB0byBzdGFjayByZWN1cnNpb24gaWYgcHJlZW1wdF9j
b3VudF97YWRkLCBzdWJ9Cj4gPiBpcyB0cmFjZWFibGUgaW4ga3Byb2JlX2J1c3lfe2JlZ2luLCBl
bmR9Lgo+ID4KPiA+IFRoaW5ncyBnb2VzIGxpa2UgdGhpcyB3aXRob3V0IHRoaXMgcGF0Y2ggcXVv
dGVkIGZyb20gU3RldmVuOgo+ID4gIgo+ID4gZnByb2JlX2twcm9iZV9oYW5kbGVyKCkgewo+ID4g
ICAga3Byb2JlX2J1c3lfYmVnaW4oKSB7Cj4gPiAgICAgICBwcmVlbXB0X2Rpc2FibGUoKSB7Cj4g
PiAgICAgICAgICBwcmVlbXB0X2NvdW50X2FkZCgpIHsgIDwtLSB0cmFjZQo+ID4gICAgICAgICAg
ICAgZnByb2JlX2twcm9iZV9oYW5kbGVyKCkgewo+ID4gICAgICAgICAgICAgICBbIHdhc2gsIHJp
bnNlLCByZXBlYXQsIENSQVNIISEhIF0KPiA+ICIKPiA+Cj4gPiBCeSByZWZhY3RvcmluZyB0aGUg
Y29tbW9uIHBhcnQgb3V0IG9mIGZwcm9iZV9rcHJvYmVfaGFuZGxlciBhbmQKPiA+IGZwcm9iZV9o
YW5kbGVyIGFuZCBjYWxsIGZ0cmFjZSByZWN1cnNpb24gZGV0ZWN0aW9uIGF0IHRoZSB2ZXJ5IGJl
Z2lubmluZywKPiA+IHRoZSB3aG9sZSBmcHJvYmVfa3Byb2JlX2hhbmRsZXIgaXMgZnJlZSBmcm9t
IHJlY3Vyc2lvbi4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaZSBHYW8gPHplZ2FvQHRlbmNlbnQu
Y29tPgo+ID4gQWNrZWQtYnk6IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtl
cm5lbC5vcmc+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC10cmFjZS1r
ZXJuZWwvMjAyMzA1MTYwNzE4MzAuODE5MC0zLXplZ2FvQHRlbmNlbnQuY29tCj4gPiAtLS0KPiA+
ICBrZXJuZWwvdHJhY2UvZnByb2JlLmMgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvdHJhY2UvZnByb2JlLmMg
Yi9rZXJuZWwvdHJhY2UvZnByb2JlLmMKPiA+IGluZGV4IDlhYmIzOTA1YmM4ZS4uMDk3Yzc0MDc5
OWJhIDEwMDY0NAo+ID4gLS0tIGEva2VybmVsL3RyYWNlL2Zwcm9iZS5jCj4gPiArKysgYi9rZXJu
ZWwvdHJhY2UvZnByb2JlLmMKPiA+IEBAIC0yMCwzMCArMjAsMjIgQEAgc3RydWN0IGZwcm9iZV9y
ZXRob29rX25vZGUgewo+ID4gICAgICAgY2hhciBkYXRhW107Cj4gPiAgfTsKPiA+Cj4gPiAtc3Rh
dGljIHZvaWQgZnByb2JlX2hhbmRsZXIodW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBw
YXJlbnRfaXAsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMg
Km9wcywgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykKPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQg
X19mcHJvYmVfaGFuZGxlcih1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nCj4gPiArICAg
ICAgICAgICAgIHBhcmVudF9pcCwgc3RydWN0IGZ0cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFj
ZV9yZWdzICpmcmVncykKPgo+IE9LLCBJIHBpY2tlZCB1cCB0aGlzIHNlcmllcyB0byBwcm9iZXMv
Zml4ZXMuIE5vdGUgdGhhdCBJIGZpeGVkIHRoaXMgbGluZQo+IGJlY2F1c2UgdGhlICJ1bnNpZ25l
ZCBsb25nIHBhcmVudF9pcCIgd2FzIHNwbGl0IGludG8gMiBsaW5lcy4KPgo+IFRoYW5rIHlvdSwK
Pgo+Cj4gPiAgewo+ID4gICAgICAgc3RydWN0IGZwcm9iZV9yZXRob29rX25vZGUgKmZwcjsKPiA+
ICAgICAgIHN0cnVjdCByZXRob29rX25vZGUgKnJoID0gTlVMTDsKPiA+ICAgICAgIHN0cnVjdCBm
cHJvYmUgKmZwOwo+ID4gICAgICAgdm9pZCAqZW50cnlfZGF0YSA9IE5VTEw7Cj4gPiAtICAgICBp
bnQgYml0LCByZXQ7Cj4gPiArICAgICBpbnQgcmV0Owo+ID4KPiA+ICAgICAgIGZwID0gY29udGFp
bmVyX29mKG9wcywgc3RydWN0IGZwcm9iZSwgb3BzKTsKPiA+IC0gICAgIGlmIChmcHJvYmVfZGlz
YWJsZWQoZnApKQo+ID4gLSAgICAgICAgICAgICByZXR1cm47Cj4gPiAtCj4gPiAtICAgICBiaXQg
PSBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdHJ5bG9jayhpcCwgcGFyZW50X2lwKTsKPiA+IC0gICAg
IGlmIChiaXQgPCAwKSB7Cj4gPiAtICAgICAgICAgICAgIGZwLT5ubWlzc2VkKys7Cj4gPiAtICAg
ICAgICAgICAgIHJldHVybjsKPiA+IC0gICAgIH0KPiA+Cj4gPiAgICAgICBpZiAoZnAtPmV4aXRf
aGFuZGxlcikgewo+ID4gICAgICAgICAgICAgICByaCA9IHJldGhvb2tfdHJ5X2dldChmcC0+cmV0
aG9vayk7Cj4gPiAgICAgICAgICAgICAgIGlmICghcmgpIHsKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICBmcC0+bm1pc3NlZCsrOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+ICAgICAgICAgICAgICAgfQo+ID4g
ICAgICAgICAgICAgICBmcHIgPSBjb250YWluZXJfb2YocmgsIHN0cnVjdCBmcHJvYmVfcmV0aG9v
a19ub2RlLCBub2RlKTsKPiA+ICAgICAgICAgICAgICAgZnByLT5lbnRyeV9pcCA9IGlwOwo+ID4g
QEAgLTYxLDIzICs1Myw2MCBAQCBzdGF0aWMgdm9pZCBmcHJvYmVfaGFuZGxlcih1bnNpZ25lZCBs
b25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ICAgICAgICAgICAgICAgZWxzZQo+
ID4gICAgICAgICAgICAgICAgICAgICAgIHJldGhvb2tfaG9vayhyaCwgZnRyYWNlX2dldF9yZWdz
KGZyZWdzKSwgdHJ1ZSk7Cj4gPiAgICAgICB9Cj4gPiAtb3V0Ogo+ID4gK30KPiA+ICsKPiA+ICtz
dGF0aWMgdm9pZCBmcHJvYmVfaGFuZGxlcih1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25n
IHBhcmVudF9pcCwKPiA+ICsgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wcywgc3Ry
dWN0IGZ0cmFjZV9yZWdzICpmcmVncykKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3QgZnByb2JlICpm
cDsKPiA+ICsgICAgIGludCBiaXQ7Cj4gPiArCj4gPiArICAgICBmcCA9IGNvbnRhaW5lcl9vZihv
cHMsIHN0cnVjdCBmcHJvYmUsIG9wcyk7Cj4gPiArICAgICBpZiAoZnByb2JlX2Rpc2FibGVkKGZw
KSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgLyogcmVjdXJzaW9u
IGRldGVjdGlvbiBoYXMgdG8gZ28gYmVmb3JlIGFueSB0cmFjZWFibGUgZnVuY3Rpb24gYW5kCj4g
PiArICAgICAgKiBhbGwgZnVuY3Rpb25zIGJlZm9yZSB0aGlzIHBvaW50IHNob3VsZCBiZSBtYXJr
ZWQgYXMgbm90cmFjZQo+ID4gKyAgICAgICovCj4gPiArICAgICBiaXQgPSBmdHJhY2VfdGVzdF9y
ZWN1cnNpb25fdHJ5bG9jayhpcCwgcGFyZW50X2lwKTsKPiA+ICsgICAgIGlmIChiaXQgPCAwKSB7
Cj4gPiArICAgICAgICAgICAgIGZwLT5ubWlzc2VkKys7Cj4gPiArICAgICAgICAgICAgIHJldHVy
bjsKPiA+ICsgICAgIH0KPiA+ICsgICAgIF9fZnByb2JlX2hhbmRsZXIoaXAsIHBhcmVudF9pcCwg
b3BzLCBmcmVncyk7Cj4gPiAgICAgICBmdHJhY2VfdGVzdF9yZWN1cnNpb25fdW5sb2NrKGJpdCk7
Cj4gPiArCj4gPiAgfQo+ID4gIE5PS1BST0JFX1NZTUJPTChmcHJvYmVfaGFuZGxlcik7Cj4gPgo+
ID4gIHN0YXRpYyB2b2lkIGZwcm9iZV9rcHJvYmVfaGFuZGxlcih1bnNpZ25lZCBsb25nIGlwLCB1
bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wcywgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncykKPiA+
ICB7Cj4gPiAtICAgICBzdHJ1Y3QgZnByb2JlICpmcCA9IGNvbnRhaW5lcl9vZihvcHMsIHN0cnVj
dCBmcHJvYmUsIG9wcyk7Cj4gPiArICAgICBzdHJ1Y3QgZnByb2JlICpmcDsKPiA+ICsgICAgIGlu
dCBiaXQ7Cj4gPiArCj4gPiArICAgICBmcCA9IGNvbnRhaW5lcl9vZihvcHMsIHN0cnVjdCBmcHJv
YmUsIG9wcyk7Cj4gPiArICAgICBpZiAoZnByb2JlX2Rpc2FibGVkKGZwKSkKPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAgLyogcmVjdXJzaW9uIGRldGVjdGlvbiBoYXMg
dG8gZ28gYmVmb3JlIGFueSB0cmFjZWFibGUgZnVuY3Rpb24gYW5kCj4gPiArICAgICAgKiBhbGwg
ZnVuY3Rpb25zIGNhbGxlZCBiZWZvcmUgdGhpcyBwb2ludCBzaG91bGQgYmUgbWFya2VkIGFzIG5v
dHJhY2UKPiA+ICsgICAgICAqLwo+ID4gKyAgICAgYml0ID0gZnRyYWNlX3Rlc3RfcmVjdXJzaW9u
X3RyeWxvY2soaXAsIHBhcmVudF9pcCk7Cj4gPiArICAgICBpZiAoYml0IDwgMCkgewo+ID4gKyAg
ICAgICAgICAgICBmcC0+bm1pc3NlZCsrOwo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiAr
ICAgICB9Cj4gPgo+ID4gICAgICAgaWYgKHVubGlrZWx5KGtwcm9iZV9ydW5uaW5nKCkpKSB7Cj4g
PiAgICAgICAgICAgICAgIGZwLT5ubWlzc2VkKys7Cj4gPiAgICAgICAgICAgICAgIHJldHVybjsK
PiA+ICAgICAgIH0KPiA+ICsKPiA+ICAgICAgIGtwcm9iZV9idXN5X2JlZ2luKCk7Cj4gPiAtICAg
ICBmcHJvYmVfaGFuZGxlcihpcCwgcGFyZW50X2lwLCBvcHMsIGZyZWdzKTsKPiA+ICsgICAgIF9f
ZnByb2JlX2hhbmRsZXIoaXAsIHBhcmVudF9pcCwgb3BzLCBmcmVncyk7Cj4gPiAgICAgICBrcHJv
YmVfYnVzeV9lbmQoKTsKPiA+ICsgICAgIGZ0cmFjZV90ZXN0X3JlY3Vyc2lvbl91bmxvY2soYml0
KTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGZwcm9iZV9leGl0X2hhbmRsZXIoc3RydWN0
IHJldGhvb2tfbm9kZSAqcmgsIHZvaWQgKmRhdGEsCj4gPiAtLQo+ID4gMi40MC4xCj4gPgo+Cj4K
PiAtLQo+IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
