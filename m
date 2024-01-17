Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B70C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 20:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tteoS7vwR659u85U2GLXFjf5CWnZXubsCKPgD3MmTzE=; b=rzCLK7WFuUvoNZ
	5fXV0nGeDz0/6wMkc7tZj9wm4e9v8S5IHKdePTyjA6+ueYGItVP5ulgDEtka2oShb5ji01IrUi9tE
	OQM7mX9kVrij+4s/x0r6KHOLHWibCj2pyZWmuak7DNYXoN6BvhqwA6f3cU7DBdAHRjUBFuBh5ZHDq
	RvX4QlBv307y0qu+v80iMkQ1cBOFDDigLI9leMMYtFCs5BprBL/Ph5JE4zl77Biy1pNmTZQdNXNkT
	NVyfPNac/cZG6IdQ+2uUVSTxrS9NtWQ9zUg22RQXPjb/6nOhz40aUZg8LqKNkI2nBmmFO2nRVrCI6
	Rld/PmsVI9xq5OvDfHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQCY8-000fE8-24;
	Wed, 17 Jan 2024 20:30:12 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQCY4-000f8e-2N
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 20:30:10 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7ce9defc4c2so1953362241.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jan 2024 12:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705523390; x=1706128190; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD575AqDWxtRQQng31p0N7tpxf/VKKoFokMvFPXs22A=;
        b=rv4ME4Y4LS8e9I/1qL3DtrMuGern5E6ji3alK0hUdZYz95f6FT//I/P7H5TZrw3rmd
         LqALpGHKytiDhHS+xb+na7NUEegjtMRjclPz0sQyZWR9oUHruUHplE4yO3zZebHthzFV
         +MRGOsdoXB2jxk6/5Vs433JY2YTvXQMNnEnM5YAneJRYQQi3DPFWUSy2aC8/GZFBcvxx
         6FzRBXjf/5/FP9I8Le3NozWv+PbageByQonyL/qXvP83D8xEeix6Iq90/w6m2oo1TOCT
         kpsezU+wykmAQhA5FL9VBgxE3SE+XVbxWjo0/PuCQeLO1LLtXfzH8sDj0eLARXCd1++p
         MISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705523390; x=1706128190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD575AqDWxtRQQng31p0N7tpxf/VKKoFokMvFPXs22A=;
        b=WaQV65n+fYM/r4IBnfC9mT7WHMAK8GNej0PJu/ixbzdMApuX5FscOjuL7mgm5o4D2L
         7JiJ/hCh/mgdfr6pWCsDcM+4Ci7Lv416D8zbi0vEnu3zdXnWqH+vJYI7mfoEaEBRs52O
         YNhOT/G5D+bo19Q6O8vC0+WhOUtjzDKN3MCt6+WtugIm3QMW7YMFKPhPYN7fyM+y5qYe
         s6SpEXBjudcg6pRq+zlH/EDkztI1h1rrE/Gnkt0+RG6FXj9jpE7PqdeToqCb/bVLr9oP
         3sg1PFb2zunzXtPO9UJpiTAGk7jE+XwCURWEBcsy0arYDYAa+NIPZOueIyaX5EMowXnm
         mioQ==
X-Gm-Message-State: AOJu0YxNpxL5HNHvIJ0nPuWQ7Qa2+6whBxBUL64rnC5FV/7wBOcDipri
	tz2h0hzRd0wBCPWpHT6YmwlldIr1lIZTF/PElFZL4CGZqqmg
X-Google-Smtp-Source: AGHT+IEcHVbqKvU1d7EVd9t6CRSCb7KpK6x0WFogReXb/nzS1/CfbAfHDdma8k5FrNqyvEeozP9wt5g6lskJL31I8Ig=
X-Received: by 2002:a67:ef8b:0:b0:467:ddc7:e7c0 with SMTP id
 r11-20020a67ef8b000000b00467ddc7e7c0mr3765571vsp.17.1705523390532; Wed, 17
 Jan 2024 12:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com> <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
In-Reply-To: <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 17 Jan 2024 12:29:12 -0800
Message-ID: <CABCJKudpbeJ+Orie3oMiWrYS0qsh+ZxXbz9tTJcHKvJjiOX+=Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	akpm@linux-foundation.org, keescook@chromium.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_123008_775520_84F5841C 
X-CRM114-Status: GOOD (  16.09  )
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

SGkgUGFsbWVyLAoKT24gV2VkLCBEZWMgNiwgMjAyMyBhdCA1OjE04oCvQU0gUGFsbWVyIERhYmJl
bHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIDI5IFNlcCAyMDIzIDE0
OjExOjU2IFBEVCAoLTA3MDApLCBzYW1pdG9sdmFuZW5AZ29vZ2xlLmNvbSB3cm90ZToKPiA+IEhp
IGFsbCwKPiA+Cj4gPiBXZSBub3RpY2VkIHRoYXQgNjQtYml0IFJJU0MtViBrZXJuZWxzIGxpbWl0
IG1tYXBfcm5kX2JpdHMgdG8gMjQKPiA+IGV2ZW4gaWYgdGhlIGhhcmR3YXJlIHN1cHBvcnRzIGEg
bGFyZ2VyIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBzaXplCj4gPiBbMV0uIFRoZXNlIHR3byBwYXRj
aGVzIGFsbG93IG1tYXBfcm5kX2JpdHNfbWF4IHRvIGJlIGNoYW5nZWQgZHVyaW5nCj4gPiBpbml0
LCBhbmQgYnVtcHMgdXAgdGhlIG1heGltdW0gcmFuZG9tbmVzcyBpZiB3ZSBlbmQgdXAgc2V0dGlu
ZyB1cAo+ID4gNC81LWxldmVsIHBhZ2luZyBhdCBib290Lgo+Cj4gU29ycnkgZm9yIG1pc3Npbmcg
dGhpcywgSSdtIGp1c3QgcG9raW5nIHRocm91Z2ggb2xkIHN0dWZmIGluIHBhdGNod29yay4KPiBB
cyBmYXIgYXMgSSBjYW4gdGVsbCB0aGlzIGlzIHN0aWxsIHJlbGV2YW50LCB0aGUgZGlzY3Vzc2lv
bnMgYXJlIGp1c3Qgb24KPiB0aGUgbW1hcCgpIGJpdHMgKGJ1dCB3ZSdkIGFscmVhZHkgc2NyZXdl
ZCB0aGF0IG9uZSB1cCBhbmQgaGF2ZSBzaW5jZQo+IGZpeGVkIGl0KS4KPgo+IFNvCj4KPiBSZXZp
ZXdlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gQWNrZWQtYnk6
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+Cj4gaW4gY2FzZSBzb21lb25l
IGVsc2Ugd2FudHMgdG8gdGFrZSBpdCwgYnV0IEknbSBPSyB0YWtpbmcgdGhhdCBNTSBwYXRjaAo+
IHdpdGggS2VlcycgcmV2aWV3LgoKSXMgdGhpcyBzdGlsbCBvbiB5b3VyIHJhZGFyIGZvciB2Ni44
IG9yIHdvdWxkIHlvdSBwcmVmZXIgbWUgdG8gcmVzZW5kCnRoZSBwYXRjaGVzPwoKU2FtaQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
