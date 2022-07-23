Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FD1C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jul 2022 01:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkII5tKaM3zjUqFvmL97GcyQATFGEWsiyWbYg5EM56M=; b=jaL4AvqA4Du5Oq
	pXtuhLijkTZyeoAra+2U5Xbv0CV+0nffys0DgRT1MgGD/P5KWOoVJapGhjv6Nd+CQTEx863FjeahL
	M5dKVhvt4tp1A/CgUg44AruR3Q1lqCZP0fTdRFpaybTfLgaqZuEjhPG2DJw+15ZjVEnVuM9TmAfNH
	TLxIT6jrB6FFClSIGywpwFIWlV6KZ8hr6W2Ssn7KFPGuzJ5E6laeAGvKtrNZN/P3qb5yaCz5mnlVY
	n8gnEhzsXXsEinhkHKZCw6mXX/OcojgGmiW23fWXg3B5RVCD/+2qblbNGMjv9gmvM9KrAK0wS5tyI
	B/jjS5SrgA25dwyPOi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF3XX-00DxEg-A1; Sat, 23 Jul 2022 01:02:43 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF3XT-00DxBa-FF
	for linux-riscv@lists.infradead.org; Sat, 23 Jul 2022 01:02:41 +0000
Received: by mail-ed1-x530.google.com with SMTP id v12so7571325edc.10
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 18:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlyu+Ezdns1o/Dl+mNDx1dSSzCArmmCHe5zOulHCgYY=;
        b=PZsBl5ooCfsAyfBssviyiVR5Tq1jj7pKvSq+8EIYiuLRuANId3eEJ8Cfne0oRH5tST
         cNckwvwkYNCJil7c4bHdQwdq+1j/ZICMbKPDmupGpGkjuYuypwIlqr25b/2zb8nGj+L7
         8X6BT7i0cfdvLYah+oB/+uw18/v7O2tlssjrHraunx39DcQd6oIsFM91LN1KRUjOeySk
         107g886IDOhDMfSuVZ8M22SN2x2lCSM95MlNgPfYmjNiwur+gHG+g9710+/nPbgwn0jJ
         VB2nk9BZ+suPliZX/YIqKiK3alTptYuhcFjUg7RbgvcF8nWJZFV9um7H8k3hL7Y+Q5TY
         PsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlyu+Ezdns1o/Dl+mNDx1dSSzCArmmCHe5zOulHCgYY=;
        b=PYx4OiGYG7w42IvV0h5+5xXK43zUJ8prU6tl1ZJ/oSX5y9QlbN55AODTI/JrEFst08
         93vE32wqJcXpdp6YzJ1p5kHPymdc1MzskyRyPET8EWqeBiEE/xKCtvRcRFEE9GbrxsJJ
         oI1UnjAaQ2ZhA01a4WH33afsW94jg3WjJKzLxfKRSPiP5hd/uEUilRL2+lVchaennE88
         Sd0WdwR4ha+dGTZ60S+SzmJoJVNFGC9lkurbz9AgsrExDTIJMIgQCcYhL7q56EovJQp3
         LOBl1chSqzHZ+hiFk2HLLmmPnJ+ruuPVcGkzWCdF6I1R0rZLM7Lc5+EmvYy9gtheCMCg
         WXew==
X-Gm-Message-State: AJIora8p4X/n+SoP/dfMnSrPIQ7p8SRbIXWmK8HYeyJvnIb17aTUPajZ
	7gnAso3+sRo+tFEllVI15+LTYtFX1SNyaA==
X-Google-Smtp-Source: AGRyM1sAMP8KHkAWh5bS378ppL8TdO4StC0sEC6TB/Rq2m5BGNgizfRRhPByQs8fPv0/46kAMhGelA==
X-Received: by 2002:a05:6402:524d:b0:43a:72fe:76b7 with SMTP id t13-20020a056402524d00b0043a72fe76b7mr2211131edd.398.1658538155443;
        Fri, 22 Jul 2022 18:02:35 -0700 (PDT)
Received: from opensuse.localnet (host-79-56-6-250.retail.telecomitalia.it. [79.56.6.250])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709061baa00b0071cef8bafc3sm2549153ejg.1.2022.07.22.18.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 18:02:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev, io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] fs: Call kmap_local_page() in copy_string_kernel()
Date: Sat, 23 Jul 2022 03:02:32 +0200
Message-ID: <2115146.irdbgypaU6@opensuse>
In-Reply-To: <Ytnr3IhSkDOjqbZ1@iweiny-desk3>
References: <20220710100136.25496-1-fmdefrancesco@gmail.com> <Ytnr3IhSkDOjqbZ1@iweiny-desk3>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_180239_573084_F94C567E 
X-CRM114-Status: GOOD (  26.44  )
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

T24gdmVuZXJkw6wgMjIgbHVnbGlvIDIwMjIgMDI6MTQ6MjAgQ0VTVCBJcmEgV2Vpbnkgd3JvdGU6
Cj4gT24gU3VuLCBKdWwgMTAsIDIwMjIgYXQgMTI6MDE6MzZQTSArMDIwMCwgRmFiaW8gTS4gRGUg
RnJhbmNlc2NvIHdyb3RlOgo+ID4gVGhlIHVzZSBvZiBrbWFwX2F0b21pYygpIGlzIGJlaW5nIGRl
cHJlY2F0ZWQgaW4gZmF2b3Igb2YgCmttYXBfbG9jYWxfcGFnZSgpLgo+ID4gCj4gPiBXaXRoIGtt
YXBfbG9jYWxfcGFnZSgpLCB0aGUgbWFwcGluZ3MgYXJlIHBlciB0aHJlYWQsIENQVSBsb2NhbCwg
bm90Cj4gPiBnbG9iYWxseSB2aXNpYmxlIGFuZCBjYW4gdGFrZSBwYWdlIGZhdWx0cy4gRnVydGhl
cm1vcmUsIHRoZSBtYXBwaW5ncyAKY2FuIGJlCj4gPiBhY3F1aXJlZCBmcm9tIGFueSBjb250ZXh0
IChpbmNsdWRpbmcgaW50ZXJydXB0cykuCj4gPiAKPiA+IFRoZXJlZm9yZSwgdXNlIGttYXBfbG9j
YWxfcGFnZSgpIGluIGNvcHlfc3RyaW5nX2tlcm5lbCgpIGluc3RlYWQgb2YKPiA+IGttYXBfYXRv
bWljKCkuCj4gPiAKPiA+IFRlc3RlZCB3aXRoIHhmc3Rlc3RzIG9uIGEgUUVNVSArIEtWTSAzMi1i
aXRzIFZNIGJvb3RpbmcgYSBrZXJuZWwgd2l0aAo+ID4gSElHSE1FTTY0R0IgZW5hYmxlZC4KPiA+
IAo+ID4gU3VnZ2VzdGVkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJpbyBNLiBEZSBGcmFuY2VzY28gPGZtZGVmcmFuY2VzY29AZ21haWwu
Y29tPgo+ID4gLS0tCj4gPiAKPiA+IEkgc2VudCBhIGZpcnN0IHBhdGNoIHRvIGZzL2V4ZWMuYyBm
b3IgY29udmVydGluZyBrbWFwKCkgYW5kIAprbWFwX2F0b21pYygpCj4gPiB0byBrbWFwX2xvY2Fs
X3BhZ2UoKToKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMjA2MzAxNjM1Mjcu
OTc3Ni0xLWZtZGVmcmFuY2VzY29AZ21haWwuY29tLwo+ID4gCj4gPiBTb21lIGRheXMgYWdvLCBJ
cmEgV2VpbnksIHdoaWxlIGhlIHdhcyByZXZpZXdpbmcgdGhhdCBwYXRjaCwgbWFkZSBtZSAKbm90
aWNlCj4gPiB0aGF0IEkgaGFkIG92ZXJsb29rZWQgYSBzZWNvbmQga21hcF9hdG9taWMoKSBpbiB0
aGUgc2FtZSBmaWxlICh0aGFua3MpOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9Z
c2lRcHRrMTl0eEhyRzRjQGl3ZWlueS1kZXNrMy8KPiA+IAo+ID4gSSd2ZSBiZWVuIGFza2VkIHRv
IHNlbmQgdGhpcyBhcyBhbiBhZGRpdGlvbmFsIGNoYW5nZS4gVGhpcyBpcyB3aHkgdGhlcmUgCndp
bGwKPiA+IG5vdCBiZSBhbnkgc2Vjb25kIHZlcnNpb24gb2YgdGhhdCBwcmV2aW91cyBwYXRjaC4K
PiA+IAo+ID4gIGZzL2V4ZWMuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9mcy9leGVjLmMg
Yi9mcy9leGVjLmMKPiA+IGluZGV4IDRhMjEyOWMwZDQyMi4uNWZhNjUyY2E1ODIzIDEwMDY0NAo+
ID4gLS0tIGEvZnMvZXhlYy5jCj4gPiArKysgYi9mcy9leGVjLmMKPiA+IEBAIC02MzksMTEgKzYz
OSwxMSBAQCBpbnQgY29weV9zdHJpbmdfa2VybmVsKGNvbnN0IGNoYXIgKmFyZywgc3RydWN0IAps
aW51eF9iaW5wcm0gKmJwcm0pCj4gPiAgCQlwYWdlID0gZ2V0X2FyZ19wYWdlKGJwcm0sIHBvcywg
MSk7Cj4gPiAgCQlpZiAoIXBhZ2UpCj4gPiAgCQkJcmV0dXJuIC1FMkJJRzsKPiA+IC0JCWthZGRy
ID0ga21hcF9hdG9taWMocGFnZSk7Cj4gPiArCQlrYWRkciA9IGttYXBfbG9jYWxfcGFnZShwYWdl
KTsKPiA+ICAJCWZsdXNoX2FyZ19wYWdlKGJwcm0sIHBvcyAmIFBBR0VfTUFTSywgcGFnZSk7Cj4g
Cj4gSSByZWFsbHkgcXVlc3Rpb24gd2h5IHdlIGNhbid0IHVzZSBtZW1jcHlfdG9fcGFnZSgpIGhl
cmUgYW5kIG1vdmUgdGhlCj4gZmx1c2hfYXJnX3BhZ2UoKSBwcmlvciB0byB0aGUgbWFwcGluZz8K
PiAKPiBmbHVzaF9hcmdfcGFnZSgpIG9ubHkgY2FsbHMgZmx1c2hfY2FjaGVfcGFnZSgpIHdoaWNo
IGRvZXMgbm90IG5lZWQgdGhlCj4gbWFwcGluZyB0byB3b3JrIGNvcnJlY3RseSBBRkFJQ1QuCgpZ
b3UncmUgcmlnaHQgaGVyZS4gSSdtIHNvcnJ5IGZvciBiZWluZyBzbyBsYXp5IGFuZCBub3QgY2hl
Y2tpbmcgdGhhdCAKZmx1c2hfYXJnX3BhZ2UoKSBkb2VzIG5vdCBuZWVkIHRvIGJlIGNhbGxlZCB3
aGlsZSB0aGUgdGFzayBob2xkcyB0aGUgbG9jYWwgCm1hcHBpbmcgOi0oCgpJbiB2MiBJJ2xsIG1v
dmUgZmx1c2hfYXJnX3BhZ2UoKSBvbmUgbGluZSBhYm92ZSBtZW1jcHlfdG9fcGFnZSgpLgoKVGhh
bmtzIGZvciB5b3VyIGNvbW1lbnQsCgpGYWJpbwoKPiAKPiBJcmEKPiAKPiA+ICAJCW1lbWNweShr
YWRkciArIG9mZnNldF9pbl9wYWdlKHBvcyksIGFyZywgCmJ5dGVzX3RvX2NvcHkpOwo+ID4gIAkJ
Zmx1c2hfZGNhY2hlX3BhZ2UocGFnZSk7Cj4gPiAtCQlrdW5tYXBfYXRvbWljKGthZGRyKTsKPiA+
ICsJCWt1bm1hcF9sb2NhbChrYWRkcik7Cj4gPiAgCQlwdXRfYXJnX3BhZ2UocGFnZSk7Cj4gPiAg
CX0KPiA+ICAKPiA+IC0tIAo+ID4gMi4zNi4xCj4gPiAKPiAKCgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
