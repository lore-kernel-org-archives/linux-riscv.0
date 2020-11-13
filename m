Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90277C4742C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 23:42:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CAF2225E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 23:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fxKDcbSj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0r19MMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21CAF2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=80PdkPd2n07ZJAH2fRpZmCGpbtme1DVav+Uw4ekh9go=; b=fxKDcbSjT1brYKz5cCXscoaTd
	CvUg+HgbCK3lLmBR4D4o10QnJniP9SG20+5vequdoKWMyo33GZA+wbT/cqZgHxD1gZlLDOEZV11oy
	Q6hnuOzWbpAE5rp7PamgrGnZAk4I/lRonlp5Iino1wbqI6NSOAwccPzvAcS0osuvz1hXGtXXUqnFO
	RSaLC78KR/lTKKB63NgZ87vnIWxKpmG6XC5Kxu54Z1AgIsRcruyjw6xXE4xDan/JNGtikFqEwg+Mn
	I+WefuK05ayQRRpXVlETGA905R08o50wkh8rWDOAEbhNAKdpfVljV1O8BPK8DmmAu4L9KiN2kAjzf
	VWbkXwjSA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdiiL-0002YH-90; Fri, 13 Nov 2020 23:42:45 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdiiH-0002W7-2k; Fri, 13 Nov 2020 23:42:42 +0000
Received: by mail-lf1-x141.google.com with SMTP id j205so16592083lfj.6;
 Fri, 13 Nov 2020 15:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JqzzLgIvxHqw73GCku4Mas63TAVlMZ5DWuV5xVfKdKs=;
 b=B0r19MMZBS4qnPOpH3Oh7mviI2ESDdHEhgo+UT9aZXskXoEd9SnPfMI/JIQYxPxtOR
 EGdJ2X/BFGo2JIgPc7YKwL5OHO+C0iGUlcLt7SsFk5strPrUoRxXyWJ0RUiRQlWr4+Q9
 UGWo8SVcac0O9tQYHuBdOkO7NOuKdAMPi3UiVqcUEf+/yt3BCTCvkiiO9shXsZcgvKCI
 mqX10Qdfqu4P8JgnD2ndzSSlvwFINTNV0y8KdpRHFKCK3X2fikhgsl9ap1i9u5iJJjMW
 PWLkp0ZY+5TBxslo+fG0/WW3kZ1717ioHRkZ7oRtRA7lwDMuCMImPvZsEfTtSS5PpFGO
 gyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JqzzLgIvxHqw73GCku4Mas63TAVlMZ5DWuV5xVfKdKs=;
 b=K20+dyZGbL7/CG3/YmaVt2Jmt+pyl/ES82capFF71/kh82G+OOQKBfVeuAubxIzwBT
 qTWI6oXLkAa3spBccaa7uT7pTP5W/fQsZGXmLQuZnLwXO34Xs8Xyauw9I1ErQ4LmYoZS
 sp6mcCrAWGL1eHig4fgbwm14iHAGnsNtwCLtutTE+hhgrXJUnqkeEO92sAaWTkUIrRUO
 7+A4I5FY5Jkd4XpFRyqUu3wBcd/jG+mKHPLQIooUKAK4P5V0e/h+pU2qR3SHF7mZbXPm
 ETDswCVBuPRjeYC6iFZ1c39AWcLb/OQArxXieTRP6+8KVnrvNpWuyk7wxGN/gyo+2SHA
 YFRg==
X-Gm-Message-State: AOAM531ceThM3MKWY0vrA8224yPuy+rm6aDSOAy6fqcOsVddUaKVM8Fh
 ZA8fQaRTh9WeKsAuSt07gLgEzRqvsRKeaqTBUdE=
X-Google-Smtp-Source: ABdhPJzhCiM/9It/85NbIdVKdebxXQcus40OOuN1h7PzHPVAvA/sjezmqkryt630ZVNrgKRfchCjAC+cyB3SFkLkebc=
X-Received: by 2002:a19:e84:: with SMTP id 126mr1806647lfo.432.1605310957017; 
 Fri, 13 Nov 2020 15:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20201110151444.20662-1-rppt@kernel.org>
 <20201110151444.20662-7-rppt@kernel.org>
In-Reply-To: <20201110151444.20662-7-rppt@kernel.org>
From: Roman Gushchin <guroan@gmail.com>
Date: Fri, 13 Nov 2020 15:42:25 -0800
Message-ID: <CALo0P13aq3GsONnZrksZNU9RtfhMsZXGWhK1n=xYJWQizCd4Zw@mail.gmail.com>
Subject: Re: [PATCH v8 6/9] secretmem: add memcg accounting
To: Mike Rapoport <rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_184241_144680_E6F88D6D 
X-CRM114-Status: GOOD (  24.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

0LLRgiwgMTAg0L3QvtGP0LEuIDIwMjAg0LMuINCyIDA3OjE2LCBNaWtlIFJhcG9wb3J0IDxycHB0
QGtlcm5lbC5vcmc+Ogo+Cj4gRnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29t
Pgo+Cj4gQWNjb3VudCBtZW1vcnkgY29uc3VtZWQgYnkgc2VjcmV0bWVtIHRvIG1lbWNnLiBUaGUg
YWNjb3VudGluZyBpcyB1cGRhdGVkCj4gd2hlbiB0aGUgbWVtb3J5IGlzIGFjdHVhbGx5IGFsbG9j
YXRlZCBhbmQgZnJlZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxp
bnV4LmlibS5jb20+Cj4gLS0tCj4gIG1tL2ZpbGVtYXAuYyAgIHwgIDIgKy0KPiAgbW0vc2VjcmV0
bWVtLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL21tL2ZpbGVtYXAuYyBiL21tL2ZpbGVtYXAuYwo+IGluZGV4IDI0OWNmNDg5ZjVk
Zi4uMTEzODdhMDc3MzczIDEwMDY0NAo+IC0tLSBhL21tL2ZpbGVtYXAuYwo+ICsrKyBiL21tL2Zp
bGVtYXAuYwo+IEBAIC04NDQsNyArODQ0LDcgQEAgc3RhdGljIG5vaW5saW5lIGludCBfX2FkZF90
b19wYWdlX2NhY2hlX2xvY2tlZChzdHJ1Y3QgcGFnZSAqcGFnZSwKPiAgICAgICAgIHBhZ2UtPm1h
cHBpbmcgPSBtYXBwaW5nOwo+ICAgICAgICAgcGFnZS0+aW5kZXggPSBvZmZzZXQ7Cj4KPiAtICAg
ICAgIGlmICghaHVnZSkgewo+ICsgICAgICAgaWYgKCFodWdlICYmICFwYWdlLT5tZW1jZ19kYXRh
KSB7Cj4gICAgICAgICAgICAgICAgIGVycm9yID0gbWVtX2Nncm91cF9jaGFyZ2UocGFnZSwgY3Vy
cmVudC0+bW0sIGdmcCk7Cj4gICAgICAgICAgICAgICAgIGlmIChlcnJvcikKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIGVycm9yOwo+IGRpZmYgLS1naXQgYS9tbS9zZWNyZXRtZW0uYyBi
L21tL3NlY3JldG1lbS5jCj4gaW5kZXggMWFhMmI3Y2ZmZTBkLi4xZWI3NjY3MDE2ZmEgMTAwNjQ0
Cj4gLS0tIGEvbW0vc2VjcmV0bWVtLmMKPiArKysgYi9tbS9zZWNyZXRtZW0uYwo+IEBAIC0xNyw2
ICsxNyw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9zeXNjYWxscy5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvbWVtYmxvY2suaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BzZXVkb19mcy5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvbWVtY29udHJvbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2V0X21lbW9yeS5oPgo+
ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvc2lnbmFsLmg+Cj4KPiBAQCAtNDksNiArNTAsMzggQEAg
c3RydWN0IHNlY3JldG1lbV9jdHggewo+Cj4gIHN0YXRpYyBzdHJ1Y3QgY21hICpzZWNyZXRtZW1f
Y21hOwo+CgpIaSBNaWtlIQoKPiArc3RhdGljIGludCBzZWNyZXRtZW1fbWVtY2dfY2hhcmdlKHN0
cnVjdCBwYWdlICpwYWdlLCBnZnBfdCBnZnAsIGludCBvcmRlcikKPiArewo+ICsgICAgICAgdW5z
aWduZWQgbG9uZyBucl9wYWdlcyA9ICgxIDw8IG9yZGVyKTsKPiArICAgICAgIGludCBpLCBlcnI7
Cj4gKwo+ICsgICAgICAgZXJyID0gbWVtY2dfa21lbV9jaGFyZ2VfcGFnZShwYWdlLCBnZnAsIG9y
ZGVyKTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4g
Kwo+ICsgICAgICAgZm9yIChpID0gMTsgaSA8IG5yX3BhZ2VzOyBpKyspIHsKPiArICAgICAgICAg
ICAgICAgc3RydWN0IHBhZ2UgKnAgPSBwYWdlICsgaTsKPiArCj4gKyAgICAgICAgICAgICAgIHAt
Pm1lbWNnX2RhdGEgPSBwYWdlLT5tZW1jZ19kYXRhOwo+ICsgICAgICAgfQoKSG0sIGl0IGxvb2tz
IHZlcnkgc3RyYW5nZSB0byBtZS4gV2h5IGRvIHdlIG5lZWQgdG8gY29weSBtZW1jZ19kYXRhPwpX
aGF0IGFib3V0IGNzcyByZWZlcmVuY2UgY291bnRpbmc/CgpBbmQgd2hhdCBhYm91dCBzdGF0aXN0
aWNzPwoKSSdtIHNvcnJ5IGZvciBiZWluZyBsYXRlLgoKVGhhbmsgeW91IQoKPiArCj4gKyAgICAg
ICByZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgc2VjcmV0bWVtX21lbWNnX3VuY2hh
cmdlKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgb3JkZXIpCj4gK3sKPiArICAgICAgIHVuc2lnbmVk
IGxvbmcgbnJfcGFnZXMgPSAoMSA8PCBvcmRlcik7Cj4gKyAgICAgICBpbnQgaTsKPiArCj4gKyAg
ICAgICBmb3IgKGkgPSAxOyBpIDwgbnJfcGFnZXM7IGkrKykgewo+ICsgICAgICAgICAgICAgICBz
dHJ1Y3QgcGFnZSAqcCA9IHBhZ2UgKyBpOwo+ICsKPiArICAgICAgICAgICAgICAgcC0+bWVtY2df
ZGF0YSA9IDA7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgbWVtY2dfa21lbV91bmNoYXJnZV9w
YWdlKHBhZ2UsIFBNRF9QQUdFX09SREVSKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBzZWNyZXRt
ZW1fcG9vbF9pbmNyZWFzZShzdHJ1Y3Qgc2VjcmV0bWVtX2N0eCAqY3R4LCBnZnBfdCBnZnApCj4g
IHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMgPSAoMSA8PCBQTURfUEFHRV9PUkRF
Uik7Cj4gQEAgLTYxLDEwICs5NCwxNCBAQCBzdGF0aWMgaW50IHNlY3JldG1lbV9wb29sX2luY3Jl
YXNlKHN0cnVjdCBzZWNyZXRtZW1fY3R4ICpjdHgsIGdmcF90IGdmcCkKPiAgICAgICAgIGlmICgh
cGFnZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiAtICAgICAgIGVyciA9
IHNldF9kaXJlY3RfbWFwX2ludmFsaWRfbm9mbHVzaChwYWdlLCBucl9wYWdlcyk7Cj4gKyAgICAg
ICBlcnIgPSBzZWNyZXRtZW1fbWVtY2dfY2hhcmdlKHBhZ2UsIGdmcCwgUE1EX1BBR0VfT1JERVIp
Owo+ICAgICAgICAgaWYgKGVycikKPiAgICAgICAgICAgICAgICAgZ290byBlcnJfY21hX3JlbGVh
c2U7Cj4KPiArICAgICAgIGVyciA9IHNldF9kaXJlY3RfbWFwX2ludmFsaWRfbm9mbHVzaChwYWdl
LCBucl9wYWdlcyk7Cj4gKyAgICAgICBpZiAoZXJyKQo+ICsgICAgICAgICAgICAgICBnb3RvIGVy
cl9tZW1jZ191bmNoYXJnZTsKPiArCj4gICAgICAgICBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcGFn
ZV9hZGRyZXNzKHBhZ2UpOwo+ICAgICAgICAgZXJyID0gZ2VuX3Bvb2xfYWRkKHBvb2wsIGFkZHIs
IFBNRF9TSVpFLCBOVU1BX05PX05PREUpOwo+ICAgICAgICAgaWYgKGVycikKPiBAQCAtODEsNiAr
MTE4LDggQEAgc3RhdGljIGludCBzZWNyZXRtZW1fcG9vbF9pbmNyZWFzZShzdHJ1Y3Qgc2VjcmV0
bWVtX2N0eCAqY3R4LCBnZnBfdCBnZnApCj4gICAgICAgICAgKiB3b24ndCBmYWlsCj4gICAgICAg
ICAgKi8KPiAgICAgICAgIHNldF9kaXJlY3RfbWFwX2RlZmF1bHRfbm9mbHVzaChwYWdlLCBucl9w
YWdlcyk7Cj4gK2Vycl9tZW1jZ191bmNoYXJnZToKPiArICAgICAgIHNlY3JldG1lbV9tZW1jZ191
bmNoYXJnZShwYWdlLCBQTURfUEFHRV9PUkRFUik7Cj4gIGVycl9jbWFfcmVsZWFzZToKPiAgICAg
ICAgIGNtYV9yZWxlYXNlKHNlY3JldG1lbV9jbWEsIHBhZ2UsIG5yX3BhZ2VzKTsKPiAgICAgICAg
IHJldHVybiBlcnI7Cj4gQEAgLTMxMCw2ICszNDksNyBAQCBzdGF0aWMgdm9pZCBzZWNyZXRtZW1f
Y2xlYW51cF9jaHVuayhzdHJ1Y3QgZ2VuX3Bvb2wgKnBvb2wsCj4gICAgICAgICBpbnQgaTsKPgo+
ICAgICAgICAgc2V0X2RpcmVjdF9tYXBfZGVmYXVsdF9ub2ZsdXNoKHBhZ2UsIG5yX3BhZ2VzKTsK
PiArICAgICAgIHNlY3JldG1lbV9tZW1jZ191bmNoYXJnZShwYWdlLCBQTURfUEFHRV9PUkRFUik7
Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKQo+ICAgICAgICAgICAg
ICAgICBjbGVhcl9oaWdocGFnZShwYWdlICsgaSk7Cj4gLS0KPiAyLjI4LjAKPgo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
