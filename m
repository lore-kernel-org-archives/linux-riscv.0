Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA1AC54F52
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJEIXgCuOq6WKLTY+nLmCaHYsMbAbg551XfXZW97nkI=; b=M5gUQDny6e2nBR
	Sp+m5M/4T3nZRKQlqZfN9WHAof4lRf8f/nnP9qUz45bHldzFv88ZoLNEMxA5/mP95UdkU1IwLsogZ
	Q7W4Ow93EYoujvNh4R6gI4J9h0JHtuQu0rqiBWjwCet/7wCyTGtNOXGjrpaesz8yNzylOw6IqULVl
	fXW1LdnsmOOg/VkW7YSoBFMzOcgSgweltFgZ+mO74uDN7ScwGwIy/0XoTA3ktlDvr6EOLgStARaH/
	/ZWsJqURxTm7y4t1gy4VxxKrXIEsHbXpu+nrZR3Qwjz5zh8XUOSrqJUhH3aAwbsCKYDlDzGxPc2Cn
	4WnzQCKa56UcsnkSJVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3dq-00000007wdo-0XhJ;
	Wed, 29 Jul 2026 12:44:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp3dn-00000007wca-1qzW
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:44:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f6de72faso6758765e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329045; cv=none;
        d=google.com; s=arc-20260327;
        b=jKYYj+DFjIMtBn7GrWTtUQzXkA3JmuK2wPtIRHEjT2aXfrS3uSBKexqq9K9o0/V6Hr
         +hPknjjuX3QijAyjxdwE3r1SszT5sfndGkzFmcbzfJkRg1jX53q9HXqIPkmhgQ24WwI9
         bsKgoOP/hn/lDM+UZaMb/OS3g2LsksPDkOyme+3vNhq6zjRLrQfdcihOnH+KkBhs2lq1
         clF+Sdc98QIInbu4pKMeFeXQwA2m1SYVl1Kh4jxv24h8VrVpbVWe/kAAJpFPhtqVhpPW
         MUGufDk+KMGpHlLqR2DcTkVJkih9HlcNCJFAtLAapNrO1iYEWZVbVPvqc4Patefspo3S
         2ACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hm5r/xpzCIodGlWiNThjdtOQlm2HxnqjU/kCjY5K+u0=;
        fh=wlAlfJxS97mDFtdkYjo6SAzpo3OIJ2mxZkiqVJ0J3Ms=;
        b=oopkK6FHi+KEZspw4tSycS7OWT445l5eRMuHUqSTbgGOIE6oIAJG06G0UO8i92yPt6
         RAm4s6wLMU6Qpg1zrVPg3rOYiqHog/0JRh8Zmf4mf6v9Sz30caQEQ/DsTksdKg2vix6z
         n1ef5mBg31wvhfVRjbs4+YGgYLB/VRJ9z5wQfpMf9Ex2i78vTs35PLLWP80ZO6YVuiTA
         AyaFJGfilsvlLSsV5JDVN83wTO0Wo7T0VoIXMmrK6mi12fSNEmAQzFRAFPYmKFOaWfNX
         ypZ3GEBUUpvnayaAelqFwBDzsmhR2B2KcxyYXxq/XSJvsaMJmSxzaMH3bGiU+aBgl88j
         /tfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785329045; x=1785933845; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hm5r/xpzCIodGlWiNThjdtOQlm2HxnqjU/kCjY5K+u0=;
        b=ogzZOmFLMkIunzvMUzaAsuv3wq9JYR+2VWs8B89RiCFRYgyCRkScJL+VR3riC4jdY6
         nGF2Lsx0i2eN4+nHTTwuTALRFquvCNPCy4Aeqhn6FsDcuWWUwgTd7gIO4EUHqkSG/GSb
         e0xTqVUxE30+wDn6PJE05oCNy2XbDVmf1834g3N53SQzIRe32EHROSyjx0f3car3JYMO
         IBn/29a0F1rBUagy+AFdQWMhp3kTlTpBXMPiB9sUjmlxBVyYSNoo/YS8wRtDfzh4sFa2
         baeFdGuhr2hpUCknYWmdU718GYPpxycq+2JupxpW9vB+zdHDm88bQKMvcRVrQ+owtHP2
         IZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329045; x=1785933845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hm5r/xpzCIodGlWiNThjdtOQlm2HxnqjU/kCjY5K+u0=;
        b=DlKx58Q9RwYiWd8N9/GrZJ4H33CaVFx33bCPr5COK9r48zkGnsc14ufvpq90HZJhoZ
         qmS0rznGP2NFKTBA08ATK25i2mfOaOfWpYCa/HQnypBbWy65UqFyZUTSdnc8mfscsm+D
         CQL05RVswby8gaNgCR+Lp9EooAYU8BSsLl+LggPcreK/LmcLUsKXrIhBmS/5MOGC7Ytm
         XdlyKWKCbJ/s22gjHvHn0ux5V0n6mlMZLWYXIPi5jfPy+Mts0SnGlVpLGEUAFIW1Yc4I
         OnEFD9hSUyx4UKFq2u4tc1cEUOTEGIj0lN/jHT0AoFQQsuz6lGSJd3QrAGdfNCRuDZyp
         oiiw==
X-Forwarded-Encrypted: i=1; AHgh+RrCur3Spc19jxk2QjZwItnp6oicXFODwJF1svqVoENjddC/8mCiSFhZNjQ1miCDAE37OZZcgK7xFqoKog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIXQ/pPlbvBtw7YrNlrXUfqwNt/RZItBS3TFijoJlndjfSQ+ST
	P/sxyzPm+SLcvqZDFgPSnt6qt0u745TtTSRiF/YzJSoxfMNEBP9Z6mqMLsfj+wyirYT7yBf0JJ0
	dN8aNogxenDfCTMef15AUa/nqSCYxpJkqhFuNd63R/w==
X-Gm-Gg: AR+sD126nQxMIQQo45kfIg6OfBQQH4cUXDrYEub2xpcQRQ7QQ6c7tqPs13aowGLIi9/
	WQIyih1J4wVso4KhLm3UK38PtHMkDuOky2Y64GET2ii0CBpim3NalQN1/9UfHR4ZoEJ9Qyp84VK
	46iyx16Y7kLgDDZ9KB6gg+JgPSnoFT9IQ00kUj6aIj3fS2N/l0loDIsbWAkc+KQi8DKsu1r7qYx
	taZMq3QJDIEsQiqORSfLonejIQLEsGl5yJzA5FyoDrFOxZQqEmthzj0Vj74ZlioNch+TqGfdwSK
	oisX4GVI7SftdrI3P7wXVxxGVIywJU79N1gcBa3hnPvip9oTdTuYllV3QIw8wQhvJASHlVMyCMa
	eh+K5dCfW99a3eLZ1zVmNpCe4oRDoRZYnHrifmEkDB0ABOGHhOIme09iWgYL239w=
X-Received: by 2002:a05:600c:4746:b0:495:3c6f:7c18 with SMTP id
 5b1f17b1804b1-497fd2f50bbmr22311715e9.3.1785329045078; Wed, 29 Jul 2026
 05:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260713010302.303278-1-inochiama@gmail.com> <20260713010302.303278-2-inochiama@gmail.com>
In-Reply-To: <20260713010302.303278-2-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 18:13:52 +0530
X-Gm-Features: AUfX_mwNGvCJ0K_M3RbragaNPirqy3_PcAwefERtLMiHMQvQ2ITGlUlXogu6tRE
Message-ID: <CAAhSdy2dGry-jgpCGJyH6-qRbp2WVsJU39XskkigxCdyxmi=eQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] RISC-V: KVM: Add support for Svadu FWFT features
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Andy Chiu <andybnac@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Deepak Gupta <debug@rivosinc.com>, 
	Thomas Huth <thuth@redhat.com>, Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_054407_730056_04775B8A 
X-CRM114-Status: GOOD (  22.40  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgNjozM+KAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGFyZHdhcmUgdXBkYXRpbmcgb2YgUFRFIEEvRCBiaXRz
IGlzIGNvbnRyb2xsZWQgdGhyb3VnaCBBRFVFIGJpdCBpbgo+IGhlbnZjZmcgRXhwb3NlIHRoZSBm
ZWF0dXJlIG9ubHkgaWYgYm90aCBTdmFkdSBhbmQgU3ZhZGUgYXJlIHN1cHBvcnRlZAo+IGZvciBW
Uy1tb2RlLgo+Cj4gQWxsb3cgdGhlIFZNTSB0byBlbmFibGUvZGlzYWJsZSB0aGlzIGZlYXR1cmUg
YnkgY2hhbmdlIHRoZSBJU0EKPiBleHRlbnNpb24gc3RhdGUgaW4gdGhlIGd1ZXN0Lgo+Cj4gQXNz
aXN0ZWQtYnk6IFl1YW5TaGVuZzpjbGF1ZGUtNC43LW9wdXMKPiBDby1kZXZlbG9wZWQtYnk6IFF1
YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91
IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxp
bm9jaGlhbWFAZ21haWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20v
a3ZtLmggfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyAgICB8IDc2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NyBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggNTA0ZTczMzA1
MzQzLi43YmJlYTg4MTJkOTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAg
LTI0MCw2ICsyNDAsNyBAQCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0X2ZlYXR1cmUgewo+ICBz
dHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9md2Z0IHsKPiAgICAgICAgIHN0cnVjdCBrdm1fcmlzY3Zfc2Jp
X2Z3ZnRfZmVhdHVyZSBtaXNhbGlnbmVkX2RlbGVnOwo+ICAgICAgICAgc3RydWN0IGt2bV9yaXNj
dl9zYmlfZndmdF9mZWF0dXJlIHBvaW50ZXJfbWFza2luZzsKPiArICAgICAgIHN0cnVjdCBrdm1f
cmlzY3Zfc2JpX2Z3ZnRfZmVhdHVyZSBwdGVfYWRfaHdfdXBkYXRpbmc7Cj4gIH07Cj4KPiAgLyog
SWYgeW91IG5lZWQgdG8gaW50ZXJwcmV0IHRoZSBpbmRleCB2YWx1ZXMsIGhlcmUgaXMgdGhlIGtl
eTogKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gaW5kZXggYWIzOWFjNDY0ZmZkLi40ZDQ3NGE0
MzliMjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jCj4gQEAgLTk0LDYgKzk0LDQ1IEBAIHN0
YXRpYyBib29sIGt2bV9md2Z0X2lzX2RlZmluZWRfZmVhdHVyZShlbnVtIHNiaV9md2Z0X2ZlYXR1
cmVfdCBmZWF0dXJlKQo+ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICB9Cj4KPiArc3RhdGljIHZv
aWQga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQg
ZmxhZykKClRyeSB0byB1c2UgdXB0byA4MC05MCBjaGFyYWN0ZXJzIHBlci1saW5lLgoKcy9rdm1f
c2JpX2Z3ZnRfZW52X2ZsYWdfcmVzZXRfaGVscGVyL2t2bV9zYmlfZndmdF9lbnZjZmdfZmxhZ19y
ZXNldC8KCj4gK3sKPiArICAgICAgIHZjcHUtPmFyY2guY2ZnLmhlbnZjZmcgJj0gfmZsYWc7Cj4g
K30KPiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9lbnZfZmxhZ19zZXRfaGVscGVyKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG9uZV9yZWdfYWNjZXNzLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgdmFsdWUsIHU2NCBmbGFnKQoKcy9rdm1fc2JpX2Z3ZnRfZW52X2ZsYWdfc2V0X2hlbHBlci9r
dm1fc2JpX2Z3ZnRfZW52Y2ZnX2ZsYWdfc2V0LwoKPiArewo+ICsgICAgICAgc3RydWN0IGt2bV92
Y3B1X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+ICsKPiArICAgICAgIGlmICh2YWx1
ZSA9PSAwKQo+ICsgICAgICAgICAgICAgICBjZmctPmhlbnZjZmcgJj0gfmZsYWc7Cj4gKyAgICAg
ICBlbHNlIGlmICh2YWx1ZSA9PSAxKQo+ICsgICAgICAgICAgICAgICBjZmctPmhlbnZjZmcgfD0g
ZmxhZzsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5W
QUxJRF9QQVJBTTsKPiArCj4gKyAgICAgICBpZiAoIW9uZV9yZWdfYWNjZXNzKSB7Cj4gKyAgICAg
ICAgICAgICAgIGNzcl93cml0ZShDU1JfSEVOVkNGRywgdmNwdS0+YXJjaC5jZmcuaGVudmNmZyk7
Cj4gKyAgICAgICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9IRU5WQ0ZHSCwgdmNwdS0+YXJjaC5jZmcu
aGVudmNmZyA+PiAzMik7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIFNCSV9TVUND
RVNTOwo+ICt9Cj4gKwo+ICtzdGF0aWMgbG9uZyBrdm1fc2JpX2Z3ZnRfZW52X2ZsYWdfZ2V0X2hl
bHBlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNvbmYsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBvbmVfcmVnX2Fj
Y2VzcywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nICp2YWx1ZSwgdTY0IGZsYWcpCgpzL2t2bV9zYmlfZndmdF9lbnZfZmxhZ19nZXRf
aGVscGVyL2t2bV9zYmlfZndmdF9lbnZjZmdfZmxhZ19nZXQvCgo+ICt7Cj4gKyAgICAgICAqdmFs
dWUgPSAodmNwdS0+YXJjaC5jZmcuaGVudmNmZyAmIGZsYWcpID09IGZsYWc7Cj4gKwo+ICsgICAg
ICAgcmV0dXJuIFNCSV9TVUNDRVNTOwo+ICt9Cj4gKwo+ICBzdGF0aWMgYm9vbCBrdm1fc2JpX2Z3
ZnRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gIHsKPiAgICAgICAgIHJldHVybiBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSgpOwo+
IEBAIC0xMzcsNiArMTc2LDM0IEBAIHN0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9nZXRfbWlzYWxp
Z25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgIHJldHVybiBT
QklfU1VDQ0VTUzsKPiAgfQo+Cj4gK3N0YXRpYyBib29sIGt2bV9zYmlfZndmdF9wdGVfYWRfaHdf
dXBkYXRpbmdfc3VwcG9ydGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAg
cmV0dXJuIHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKHZjcHUtPmFyY2guaXNhLCBTVkFE
VSkgJiYKPiArICAgICAgICAgICAgICAgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUodmNw
dS0+YXJjaC5pc2EsIFNWQURFKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQga3ZtX3NiaV9md2Z0
X3Jlc2V0X3B0ZV9hZF9od191cGRhdGluZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiAr
ICAgICAgIGlmIChrdm1fc2JpX2Z3ZnRfcHRlX2FkX2h3X3VwZGF0aW5nX3N1cHBvcnRlZCh2Y3B1
KSkKPiArICAgICAgICAgICAgICAga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3Jlc2V0X2hlbHBlcih2
Y3B1LCBFTlZDRkdfQURVRSk7Cj4gK30KPiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9z
ZXRfcHRlX2FkX2h3X3VwZGF0aW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0
X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBib29sIG9uZV9yZWdfYWNjZXNzLCB1bnNpZ25lZCBsb25nIHZhbHVlKQo+ICt7Cj4g
KyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX3NldF9oZWxwZXIodmNwdSwgY29u
Ziwgb25lX3JlZ19hY2Nlc3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmFsdWUsIEVOVkNGR19BRFVFKTsKPiArfQo+ICsKPiArc3RhdGljIGxvbmcg
a3ZtX3NiaV9md2Z0X2dldF9wdGVfYWRfaHdfdXBkYXRpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBrdm1fc2JpX2Z3ZnRfY29uZmlnICpjb25mLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgb25lX3JlZ19hY2Nlc3MsIHVuc2lnbmVkIGxvbmcg
KnZhbHVlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX3NiaV9md2Z0X2Vudl9mbGFnX2dldF9o
ZWxwZXIodmNwdSwgY29uZiwgb25lX3JlZ19hY2Nlc3MsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsdWUsIEVOVkNGR19BRFVFKTsKPiArfQo+ICsK
PiAgI2lmbmRlZiBDT05GSUdfMzJCSVQKPgo+ICBzdGF0aWMgYm9vbCB0cnlfdG9fc2V0X3BtbSh1
bnNpZ25lZCBsb25nIHZhbHVlKQo+IEBAIC0yNDYsNiArMzEzLDE1IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKPiAgICAgICAgICAgICAg
ICAgLnNldCA9IGt2bV9zYmlfZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ICAgICAg
ICAgICAgICAgICAuZ2V0ID0ga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24s
Cj4gICAgICAgICB9LAo+ICsgICAgICAgewo+ICsgICAgICAgICAgICAgICAuaWQgPSBTQklfRldG
VF9QVEVfQURfSFdfVVBEQVRJTkcsCj4gKyAgICAgICAgICAgICAgIC5maXJzdF9yZWdfbnVtID0g
b2Zmc2V0b2Yoc3RydWN0IGt2bV9yaXNjdl9zYmlfZndmdCwgcHRlX2FkX2h3X3VwZGF0aW5nLmVu
YWJsZSkgLwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZih1bnNpZ25l
ZCBsb25nKSwKPiArICAgICAgICAgICAgICAgLnN1cHBvcnRlZCA9IGt2bV9zYmlfZndmdF9wdGVf
YWRfaHdfdXBkYXRpbmdfc3VwcG9ydGVkLAo+ICsgICAgICAgICAgICAgICAucmVzZXQgPSBrdm1f
c2JpX2Z3ZnRfcmVzZXRfcHRlX2FkX2h3X3VwZGF0aW5nLAo+ICsgICAgICAgICAgICAgICAuc2V0
ID0ga3ZtX3NiaV9md2Z0X3NldF9wdGVfYWRfaHdfdXBkYXRpbmcsCj4gKyAgICAgICAgICAgICAg
IC5nZXQgPSBrdm1fc2JpX2Z3ZnRfZ2V0X3B0ZV9hZF9od191cGRhdGluZywKPiArICAgICAgIH0s
Cj4gICNpZm5kZWYgQ09ORklHXzMyQklUCj4gICAgICAgICB7Cj4gICAgICAgICAgICAgICAgIC5p
ZCA9IFNCSV9GV0ZUX1BPSU5URVJfTUFTS0lOR19QTUxFTiwKPiAtLQo+IDIuNTUuMAo+CgpPdGhl
cndpc2UsIHRoaXMgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
