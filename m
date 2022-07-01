Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD50CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HIR608K3Vm+uP6FlzLVnsV6Z31lVhLJI1ufdTMV18w=; b=BiF4hpvHJJB/BZ
	hr+2zBUih80ap9OJB2FG75HrJL0n6vhB08JJ6wyDoWOuRbu79iHuxvB5mEc6ahx73vEJSl4jytXyK
	1pz39rz1sDsWNMRy6S3sT3lvhWWzG02ZLB1Lf8e/90END/Bgdw/0ntclYRz0nhreGf62NceJvqu1T
	YxCuWDLlLQyxDrnCuTO0dW4jCv85hCCg7DOXrunTBNeuTmmeEe49W/kl2vRj73NR8ebDz8Jk6gnRq
	dULeaRErHDGn82wc4VoaBLSe5n6WT0OlvqPEOisElELhxpIWp/CsvHuGOliRs+EeqDZmzWibtFb6J
	Tr+MLMtRkhBRnFHFZpGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Dbv-0041ow-Cf; Fri, 01 Jul 2022 10:10:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Dbj-0041kZ-Uz
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 10:10:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id o16-20020a05600c379000b003a02eaea815so3814820wmr.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u/VrgVPkgzQyMENrkjqrTLDR84XHdXIPxg7GPzE6OD8=;
        b=C/MmEOGhSRIfH+EXKc+5tPWL/j3KmXe2C9yF4G29xk8dw1gd61VTKWCyxtLAZxh4sb
         UE5/kL75GepM+uRycCWRLMpXDY85nUuyxC666CDf9pf73xgkHk37OmHMb05dNiVx0XRD
         Y2RQ3aefb1GLjqJCg6cZQpZGxI4W7dJG0I4Xu6isQM8oYWN5zHlwT3bNDD+2+f/IN2bz
         KEATzw78NNRNFuRMWf74dJWFfG1Alqj2WHdrZc3jvO2Hl91xEwPvZ3kICxcp5Cfi/xuH
         4yHXD3gEhuMOCMB1ZHwCCLoRlSGDfeUmOl6kSlr2C0uRsfmgqcQT84oSp03pN2e/Ng4L
         4JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u/VrgVPkgzQyMENrkjqrTLDR84XHdXIPxg7GPzE6OD8=;
        b=xrhVxKFzEbNzpLQVLu9WdONtbDaDlvklbPf6lVJ/8uPM8yk9cCN7txv1pqbg2AF1G0
         AeRO0UEcTKlrSCiP0O1ZGodUW4urINuG6X3bVcjAJaeh0dYGfCUiW9u7nrV+pLn/ZdyO
         rJgkUIDblxfhbIqwYqSfkNx+QE8oYx6gN+aUpk6EUPHihoMQaM3fVufux5QxVGFjGC0l
         rnWkSyMaEpz7IuLylm2l9wKZnobDediZWIiw/vbhSbJuJmcm/gQWTMFET8qLbsgQwxc3
         VyHk8o4zpL4YSd38CodUCt1zlcgBn1tAY69T4NO4TBxCkxil54peUSPlyWs0k6dh+pnk
         D7rg==
X-Gm-Message-State: AJIora8crsdRLDuZNvE1PIPWIChdv/iZ+XdEun+G0osruB8CJg4HqYrh
	VwQFrNRLGSiIAvRgDwVcv1Q=
X-Google-Smtp-Source: AGRyM1stCxr1gM7DIYC9Nmu+TnueYLM+JhpsNdef1mUcnSairJRZL+vZe4MHLjaYJlH6VyT7URSq+Q==
X-Received: by 2002:a05:600c:b51:b0:3a1:71b0:a115 with SMTP id k17-20020a05600c0b5100b003a171b0a115mr13622469wmr.41.1656670237475;
        Fri, 01 Jul 2022 03:10:37 -0700 (PDT)
Received: from opensuse.localnet (host-79-53-109-127.retail.telecomitalia.it. [79.53.109.127])
        by smtp.gmail.com with ESMTPSA id m12-20020adfe0cc000000b0021d4155cd6fsm3257748wri.53.2022.07.01.03.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:10:36 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>, Ira Weiny <ira.weiny@intel.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Kees Cook <keescook@chromium.org>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev, io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fs: Replace kmap{,_atomic}() with kmap_local_page()
Date: Fri, 01 Jul 2022 12:10:33 +0200
Message-ID: <3187836.aeNJFYEL58@opensuse>
In-Reply-To: <8735fmqcfz.fsf@email.froward.int.ebiederm.org>
References: <20220630163527.9776-1-fmdefrancesco@gmail.com> <8735fmqcfz.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_031040_061907_0A1260E1 
X-CRM114-Status: GOOD (  29.80  )
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

T24gZ2lvdmVkw6wgMzAgZ2l1Z25vIDIwMjIgMTk6Mzg6MDggQ0VTVCBFcmljIFcuIEJpZWRlcm1h
biB3cm90ZToKPiAiRmFiaW8gTS4gRGUgRnJhbmNlc2NvIiA8Zm1kZWZyYW5jZXNjb0BnbWFpbC5j
b20+IHdyaXRlczoKPiAKPiA+IFRoZSB1c2Ugb2Yga21hcCgpIGFuZCBrbWFwX2F0b21pYygpIGFy
ZSBiZWluZyBkZXByZWNhdGVkIGluIGZhdm9yIG9mCj4gPiBrbWFwX2xvY2FsX3BhZ2UoKS4KPiA+
Cj4gPiBXaXRoIGttYXBfbG9jYWxfcGFnZSgpLCB0aGUgbWFwcGluZ3MgYXJlIHBlciB0aHJlYWQs
IENQVSBsb2NhbCBhbmQgbm90Cj4gPiBnbG9iYWxseSB2aXNpYmxlLiBGdXJ0aGVybW9yZSwgdGhl
IG1hcHBpbmdzIGNhbiBiZSBhY3F1aXJlZCBmcm9tIGFueQo+ID4gY29udGV4dCAoaW5jbHVkaW5n
IGludGVycnVwdHMpLgo+ID4KPiA+IFRoZXJlZm9yZSwgdXNlIGttYXBfbG9jYWxfcGFnZSgpIGlu
IGV4ZWMuYyBiZWNhdXNlIHRoZXNlIG1hcHBpbmdzIGFyZSAKcGVyCj4gPiB0aHJlYWQsIENQVSBs
b2NhbCwgYW5kIG5vdCBnbG9iYWxseSB2aXNpYmxlLgo+ID4KPiA+IFRlc3RlZCB3aXRoIHhmc3Rl
c3RzIG9uIGEgUUVNVSArIEtWTSAzMi1iaXRzIFZNIGJvb3RpbmcgYSBrZXJuZWwgd2l0aAo+ID4g
SElHSE1FTTY0R0IgZW5hYmxlZC4KPiAKPiBDYW4gc29tZW9uZSBwbGVhc2UgcmVmcmVzaCBteSBt
ZW1vcnkgb24gd2hhdCBpcyBnb2luZyBvbi4KPiAKPiBJIHJlbWVtYmVyIHRoZXJlIHdlcmUgbGlt
aXRhdGlvbnMgdGhhdCBrbWFwX2F0b21pYyBoYWQgdGhhdCBhcmUgaGFyZCB0bwo+IG1lZXQgc28g
c29tZXRoaW5nIEkgdGhpbmsgaXQgd2FzIGttYXBfbG9jYWwgd2FzIGludmVudGVkIGFuZCBjcmVh
dGVkCj4gdG8gYmUgdGhlIGttYXBfYXRvbWljIHJlcGxhY2VtZW50LgoKUGxlYXNlIHJlYWQgaGln
aG1lbS5yc3QuIEkndmUgdXBkYXRlZCB0aGF0IGRvY3VtZW50IHdlZWtzIGFnbzoKaHR0cHM6Ly9k
b2NzLmtlcm5lbC5vcmcvdm0vaGlnaG1lbS5odG1sP2hpZ2hsaWdodD1oaWdobWVtCgpDdXJyZW50
bHkgaXQgY29udGFpbnMgbWFueSBtb3JlIGluZm9ybWF0aW9uIEkgY2FuIGV2ZXIgcGxhY2UgaGVy
ZSBpbiBvcmRlciAKdG8gYW5zd2VyIHlvdXIgcXVlc3Rpb25zLgoKQmVsaWV2ZSBtZSwgdGhpcyBp
cyBub3QgYnkgYW55IG1lYW5zIGEgd2F5IHRvIGVsdWRlIHlvdXIgcXVlc3Rpb25zLiBJJ20gCnBy
ZXR0eSBzdXJlIHRoYXQgYnkgcmVhZGluZyB0aGF0IGRvY3VtZW50IHlvdSdsbCBoYXZlIGEgY2xl
YXIgdmlzaW9uIG9uIAp3aGF0IGlzIGdvaW5nIG9uIDotKQoKPiAKPiBXaGF0IGFyZSB0aGUgcmVx
dWlyZW1lbnRzIG9uIGttYXBfbG9jYWw/ICBJbiBjb3B5X3N0cmluZ3MKPiBrbWFwIGlzIGNhbGxl
ZCBpbiBjb250ZXh0cyB0aGF0IGNhbiBzbGVlcCBpbiBwYWdlIGZhdWx0cwoKTm8gcHJvYmxlbXMg
d2l0aCBrbWFwX2xvY2FsX3BhZ2UoKSB3aXRoIHJlZ2FyZCB0byBwYWdlIGZhdWx0cyAoYWdhaW4s
IApwbGVhc2UgcmVhZCB0aGUgYWJvdmUtbWVudGlvbmVkIGRvY3VtZW50KS4KCkZyb20gdGhhdCBk
b2N1bWVudC4uLgoKIkl04oCZcyB2YWxpZCB0byB0YWtlIHBhZ2VmYXVsdHMgaW4gYSBsb2NhbCBr
bWFwIHJlZ2lvbiBbXSIuCgoiRWFjaCBjYWxsIG9mIGttYXBfYXRvbWljKCkgaW4gdGhlIGtlcm5l
bCBjcmVhdGVzIGEgbm9uLXByZWVtcHRpYmxlIHNlY3Rpb24gCmFuZCBkaXNhYmxlIHBhZ2VmYXVs
dHMuIFRoaXMgY291bGQgYmUgYSBzb3VyY2Ugb2YgdW53YW50ZWQgbGF0ZW5jeS4gClRoZXJlZm9y
ZSB1c2VycyBzaG91bGQgcHJlZmVyIGttYXBfbG9jYWxfcGFnZSgpIGluc3RlYWQgb2Yga21hcF9h
dG9taWMoKS4iLgoKPiBzbyBhbnkKPiBuZWFybHkgYW55IHJlcXVpcmVtZW50IGV4Y2VwdCBhIHRo
cmVhZCBsb2NhbCB1c2UgaXMgaW52YWxpZGF0ZWQuCj4gCj4gQXMgeW91IGhhdmUgZGVzY3JpYmVk
IGttYXBfbG9jYWwgYWJvdmUgaXQgZG9lcyBub3Qgc291bmQgbGlrZSBrbWFwX2xvY2FsCj4gaXMg
c2FmZSBpbiB0aGlzIGNvbnRleHQsCgpTb3JyeSwgcHJvYmFibHkgSSBzaG91bGQgYWRkIHRoYXQg
dGFraW5nIHBhZ2UgZmF1bHRzIGlzIGFsbG93ZWQuIFdvdWxkIHlvdSAKcHJlZmVyIEkgc2VuZCBh
IHYyIGFuZCBhZGQgdGhpcyBpbmZvcm1hdGlvbj8KClRoYW5rcywKCkZhYmlvCgo+IGJ1dCB0aGF0
IGNvdWxkIGp1c3QgYmUgYSBwcm9ibGVtIGluIGRlc2NyaXB0aW9uCj4gdGhhdCBteSBwb29yIG1l
bW9yeSBkb2VzIGlzIG5vdCByZWNhbGxpbmcgdGhlIG5lY2Vzc2FyeSBkZXRhaWxzIHRvCj4gY29y
cmVjdC4KPiAKPiBFcmljCj4gCj4gPiBTdWdnZXN0ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55
QGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYmlvIE0uIERlIEZyYW5jZXNjbyA8Zm1k
ZWZyYW5jZXNjb0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBmcy9leGVjLmMgfCAxNCArKysrKysr
LS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2V4ZWMuYyBiL2ZzL2V4ZWMuYwo+ID4gaW5kZXgg
MDk4OWZiODQ3MmExLi40YTIxMjljMGQ0MjIgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9leGVjLmMKPiA+
ICsrKyBiL2ZzL2V4ZWMuYwo+ID4gQEAgLTU4MywxMSArNTgzLDExIEBAIHN0YXRpYyBpbnQgY29w
eV9zdHJpbmdzKGludCBhcmdjLCBzdHJ1Y3QgCnVzZXJfYXJnX3B0ciBhcmd2LAo+ID4gIAo+ID4g
IAkJCQlpZiAoa21hcHBlZF9wYWdlKSB7Cj4gPiAgCQkJCQkKZmx1c2hfZGNhY2hlX3BhZ2Uoa21h
cHBlZF9wYWdlKTsKPiA+IC0JCQkJCWt1bm1hcChrbWFwcGVkX3BhZ2UpOwo+ID4gKwkJCQkJa3Vu
bWFwX2xvY2FsKGthZGRyKTsKPiA+ICAJCQkJCQpwdXRfYXJnX3BhZ2Uoa21hcHBlZF9wYWdlKTsK
PiA+ICAJCQkJfQo+ID4gIAkJCQlrbWFwcGVkX3BhZ2UgPSBwYWdlOwo+ID4gLQkJCQlrYWRkciA9
IGttYXAoa21hcHBlZF9wYWdlKTsKPiA+ICsJCQkJa2FkZHIgPSAKa21hcF9sb2NhbF9wYWdlKGtt
YXBwZWRfcGFnZSk7Cj4gPiAgCQkJCWtwb3MgPSBwb3MgJiBQQUdFX01BU0s7Cj4gPiAgCQkJCWZs
dXNoX2FyZ19wYWdlKGJwcm0sIGtwb3MsIAprbWFwcGVkX3BhZ2UpOwo+ID4gIAkJCX0KPiA+IEBA
IC02MDEsNyArNjAxLDcgQEAgc3RhdGljIGludCBjb3B5X3N0cmluZ3MoaW50IGFyZ2MsIHN0cnVj
dCAKdXNlcl9hcmdfcHRyIGFyZ3YsCj4gPiAgb3V0Ogo+ID4gIAlpZiAoa21hcHBlZF9wYWdlKSB7
Cj4gPiAgCQlmbHVzaF9kY2FjaGVfcGFnZShrbWFwcGVkX3BhZ2UpOwo+ID4gLQkJa3VubWFwKGtt
YXBwZWRfcGFnZSk7Cj4gPiArCQlrdW5tYXBfbG9jYWwoa2FkZHIpOwo+ID4gIAkJcHV0X2FyZ19w
YWdlKGttYXBwZWRfcGFnZSk7Cj4gPiAgCX0KPiA+ICAJcmV0dXJuIHJldDsKPiA+IEBAIC04ODMs
MTEgKzg4MywxMSBAQCBpbnQgdHJhbnNmZXJfYXJnc190b19zdGFjayhzdHJ1Y3QgbGludXhfYmlu
cHJtIAoqYnBybSwKPiA+ICAKPiA+ICAJZm9yIChpbmRleCA9IE1BWF9BUkdfUEFHRVMgLSAxOyBp
bmRleCA+PSBzdG9wOyBpbmRleC0tKSB7Cj4gPiAgCQl1bnNpZ25lZCBpbnQgb2Zmc2V0ID0gaW5k
ZXggPT0gc3RvcCA/IGJwcm0tPnAgJiAKflBBR0VfTUFTSyA6IDA7Cj4gPiAtCQljaGFyICpzcmMg
PSBrbWFwKGJwcm0tPnBhZ2VbaW5kZXhdKSArIG9mZnNldDsKPiA+ICsJCWNoYXIgKnNyYyA9IGtt
YXBfbG9jYWxfcGFnZShicHJtLT5wYWdlW2luZGV4XSkgKyAKb2Zmc2V0Owo+ID4gIAkJc3AgLT0g
UEFHRV9TSVpFIC0gb2Zmc2V0Owo+ID4gIAkJaWYgKGNvcHlfdG9fdXNlcigodm9pZCAqKSBzcCwg
c3JjLCBQQUdFX1NJWkUgLSBvZmZzZXQpIAohPSAwKQo+ID4gIAkJCXJldCA9IC1FRkFVTFQ7Cj4g
PiAtCQlrdW5tYXAoYnBybS0+cGFnZVtpbmRleF0pOwo+ID4gKwkJa3VubWFwX2xvY2FsKHNyYyk7
Cj4gPiAgCQlpZiAocmV0KQo+ID4gIAkJCWdvdG8gb3V0Owo+ID4gIAl9Cj4gPiBAQCAtMTY4MCwx
MyArMTY4MCwxMyBAQCBpbnQgcmVtb3ZlX2FyZ196ZXJvKHN0cnVjdCBsaW51eF9iaW5wcm0gKmJw
cm0pCj4gPiAgCQkJcmV0ID0gLUVGQVVMVDsKPiA+ICAJCQlnb3RvIG91dDsKPiA+ICAJCX0KPiA+
IC0JCWthZGRyID0ga21hcF9hdG9taWMocGFnZSk7Cj4gPiArCQlrYWRkciA9IGttYXBfbG9jYWxf
cGFnZShwYWdlKTsKPiA+ICAKPiA+ICAJCWZvciAoOyBvZmZzZXQgPCBQQUdFX1NJWkUgJiYga2Fk
ZHJbb2Zmc2V0XTsKPiA+ICAJCQkJb2Zmc2V0KyssIGJwcm0tPnArKykKPiA+ICAJCQk7Cj4gPiAg
Cj4gPiAtCQlrdW5tYXBfYXRvbWljKGthZGRyKTsKPiA+ICsJCWt1bm1hcF9sb2NhbChrYWRkcik7
Cj4gPiAgCQlwdXRfYXJnX3BhZ2UocGFnZSk7Cj4gPiAgCX0gd2hpbGUgKG9mZnNldCA9PSBQQUdF
X1NJWkUpOwo+IAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
