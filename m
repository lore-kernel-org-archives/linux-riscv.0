Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F5CC02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 23:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDrp+5NauTyVlp4DrFaQPljKhUsAMACdFwW/9Z788PI=; b=3yDTw3mYm+3JhK
	c9dE/CNBD1dhxmasYYTB3edm/sf2Ueb0DenQKdCj2+JwTqa74Z6KT3MlMNcI7DqQSwGxodjkU4wcO
	OUEE8QGiAHAuvOeO56e/vWtSI0c9R8827q0on4YmqcrbC/6JkjqtVhHc4RmzahGS/v0VqWf3Qyll/
	OPQRZbWcVtOuUX374P3Z1QGZfuE+SP/sZp7xdrqIf4+TjclLDy07hDy8mHH4XxOrhTiPs//8N5v5/
	dEt5K0EMpJTbrMnMUx6CyZvJtCToX7DsX3N/ZCQeIPraAoNUFqFITl8qkKYX2XlYEklueV+5c9wec
	OV83+VOLGhmWxahgD7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSTB-00000001qGd-0AKO;
	Tue, 04 Feb 2025 23:36:41 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfST8-00000001qFK-25NU
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 23:36:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38da940e689so656692f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 15:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738712196; x=1739316996; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=eZV800is9hEMH+Teiam4+s3XTKZcZ97cCpMIFnhlwrjPlC4YQVfrrsK3dEdbYw/G9M
         nbiJJD2INiCw4ZwYQ5FHO/qepkY1EJfN4Ygzf/ErMu5Y/StiqrIzRBsE1uW7B/y3Hv+s
         72/IcOx8M1qCjF0n3eQzs9n5XjtwJl5QcoAF/UBR763M1oo9uvMiWTWYsOZQ8/2L+LPd
         eeZWU1L+gPZaNh4aKhqY9ZnVIC1J6sc+HlWW8sY+gFW1VvonVovOKqsPJclG1n6dzxRH
         rss2uUAbn/gmIC/qqIYgijJqyuu0rs5QAp3E2njWa2clLD068eY92AroGKRNDF8Spadh
         yPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738712196; x=1739316996;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=C8y33MmgXo8oBJvmo9m10BQoIOWsJl62XgzSoee0IM/hBP1i5L2IxasN/jYt9Oo8AX
         uvVQiRXjSFUtDABJAA4k5Aft+vE4KDQAEM8Dc2WhvDKsS+baabvxoS+awMot5wapo+Gs
         l2kunWOtvrAY+0HIH7fDtABU28y5QA4B+O9NtBfF259sYIQ6QB8zdXCDNKPVg5t+WiVk
         LiR1oPm7IEcoHHFQm79woOHvCm99cWmIm2apKyTBKZgwLj7erjvm2ijZROPm96DMgEzh
         XpT5Wmk75NgeyWn9tffb7wtRUSmBWCHiXLRJhi3VHmu6ZGdcijkizDVsGDQCPsc5fSjz
         ZNEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNyv7ObiiIHEDQ8FgGDSfoqC9zG2fkG9rnWeQuzyuzMcSrxArU5DYm2eKwKqyzK1LKvbqhC43lrYf99g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBRMJA+WsddZjmrAEyh8Og2ctmI1IhTGJIE4zSk+ti3tmXETdL
	qEE9WP0jRQR2E8PwmK406V0BHPUqrWck8pLz9PbqVZvSYG9sXql7PM/aLYlMvnE=
X-Gm-Gg: ASbGncsEUIHB8dwm2qeAbVL5Gx3frRzNhPU3NTvfL5ZxxmFt+8JVJ6CQx6Z08AN+XRC
	2Q+9BEO6xwExHTbyLLKB7oHH2GE02krmOygIOjxiwG7FaIri4YBrUmjxhbWgALS2Ekx1v4ApqS0
	yerXc30zTFKdfC94mtDhrI6sFcVed4vhiCHBth4Zn//MUq/slWdKuL50l14avGbN6NFyN5a4Fem
	bWGxNIbgpKfnxiu6ODCA+/0LSHQ9nI4doVJsS2W2HTc4PvKNc/5w3n6QIgW5s6GgqPn13ssn/Rt
	gIY15MAR7bJL/12Av993j90bFhT1
X-Google-Smtp-Source: AGHT+IEbYs1SnazTxli1ivvCCDO1Cn9LUrxieFBceKbd6w0ve1uSZrVLlYscY7LZ+tYIHGaLpjoemg==
X-Received: by 2002:a5d:4c47:0:b0:38b:dc3d:e4be with SMTP id ffacd0b85a97d-38db49214e3mr355994f8f.51.1738712196024;
        Tue, 04 Feb 2025 15:36:36 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec369sm16900115f8f.8.2025.02.04.15.36.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2025 15:36:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
Date: Tue, 4 Feb 2025 23:36:23 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Message-Id: <0BDD645A-3BBE-4A85-9098-257B281A3BA0@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_153638_551399_E1CFAC90 
X-CRM114-Status: GOOD (  16.46  )
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

T24gNCBGZWIgMjAyNSwgYXQgMTg6NTgsIENocmlzdG9waCBMYW1ldGVyIChBbXBlcmUpIDxjbEBn
ZW50d28ub3JnPiB3cm90ZToKPiBBUk02NCBzdXBwb3J0cyBNVEUgd2hpY2ggaXMgaGFyZHdhcmUg
c3VwcG9ydCBmb3IgdGFnZ2luZyAxNiBieXRlIGdyYW51bGVzCj4gYW5kIHZlcmlmaWNhdGlvbiBv
ZiB0YWdzIGluIHBvaW50ZXJzIGFsbCBpbiBoYXJkd2FyZSBhbmQgb24gc29tZSBwbGF0Zm9ybXMK
PiB3aXRoICpubyogcGVyZm9ybWFuY2UgcGVuYWx0eSBzaW5jZSB0aGUgdGFnIGlzIHN0b3JlZCBp
biB0aGUgRUNDIGFyZWFzIG9mCj4gRFJBTSBhbmQgdmVyaWZpZWQgYXQgdGhlIHNhbWUgdGltZSBh
cyB0aGUgRUNDLgo+IAo+IENvdWxkIHdlIGdldCBzdXBwb3J0IGZvciB0aGF0PyBUaGlzIHdvdWxk
IGFsbG93IHVzIHRvIGVuYWJsZSB0YWcgY2hlY2tpbmcKPiBpbiBwcm9kdWN0aW9uIHN5c3RlbXMg
d2l0aG91dCBwZXJmb3JtYW5jZSBwZW5hbHR5IGFuZCBubyBtZW1vcnkgb3ZlcmhlYWQuCgpJdOKA
mXMgbm90IOKAnG5vIHBlcmZvcm1hbmNlIHBlbmFsdHnigJ0sIHRoZXJlIGlzIGEgY29zdCB0byB0
cmFja2luZyB0aGUgTVRFCnRhZ3MgZm9yIGNoZWNraW5nLiBJbiBhc3luY2hyb25vdXMgKG9yIGFz
eW1tZXRyaWMpIG1vZGUgdGhhdOKAmXMgbm90IHRvbwpiYWQsIGJ1dCBpbiBzeW5jaHJvbm91cyBt
b2RlIHRoZXJlIGlzIGEgc2lnbmlmaWNhbnQgb3ZlcmhlYWQgZXZlbiB3aXRoCkVDQy4gTm9ybWFs
bHkgb24gYSBzdG9yZSwgb25jZSB5b3XigJl2ZSB0cmFuc2xhdGVkIGl0IGFuZCBoYXZlIHRoZSBk
YXRhLAp5b3UgY2FuIGJ1ZmZlciBpdCB1cCBhbmQgZGVmZXIgdGhlIGFjdHVhbCB3cml0ZSB1bnRp
bCBzb21lIHRpbWUgbGF0ZXIuCklmIHlvdSBoaXQgaW4gdGhlIEwxIGNhY2hlIHRoZW4gdGhhdCB3
aWxsIHByb2JhYmx5IGJlIHF1aXRlIHNvb24sIGJ1dAppZiB5b3UgbWlzcyB0aGVuIHlvdSBoYXZl
IHRvIHdhaXQgZm9yIHRoZSBkYXRhIHRvIGNvbWUgYmFjayBmcm9tIGxvd2VyCmxldmVscyBvZiB0
aGUgaGllcmFyY2h5LCBwb3RlbnRpYWxseSBhbGwgdGhlIHdheSBvdXQgdG8gRFJBTS4gT3IgaWYg
eW91CmhhdmUgYSB3cml0ZS1hcm91bmQgY2FjaGUgdGhlbiB5b3UganVzdCBzZW5kIGl0IG91dCB0
byB0aGUgbmV4dCBsZXZlbAp3aGVuIGl04oCZcyByZWFkeS4gQnV0IG5vdywgaWYgeW91IGhhdmUg
c3luY2hyb25vdXMgTVRFLCB5b3UgY2Fubm90CnJldGlyZSB5b3VyIHN0b3JlIGluc3RydWN0aW9u
IHVudGlsIHlvdSBrbm93IHdoYXQgdGhlIHRhZyBmb3IgdGhlCmxvY2F0aW9uIHlvdeKAmXJlIHN0
b3JpbmcgdG8gaXM7IGVmZmVjdGl2ZWx5IHlvdSBoYXZlIHRvIHdhaXQgdW50aWwgeW91CmNhbiBk
byB0aGUgZnVsbCBjYWNoZSBsb29rdXAsIGFuZCBwb3RlbnRpYWxseSBtaXNzLCB1bnRpbCBpdCBj
YW4KcmV0aXJlLiBUaGlzIHB1dHMgcHJlc3N1cmUgb24gdGhlIHZhcmlvdXMgbWljcm9hcmNoaXRl
Y3R1cmFsIHN0cnVjdHVyZXMKdGhhdCB0cmFjayBpbnN0cnVjdGlvbnMgYXMgdGhleSBnZXQgZXhl
Y3V0ZWQsIGFzIGluc3RydWN0aW9ucyBhcmUgbm93CmluIGZsaWdodCBmb3IgbG9uZ2VyLiBZZXMs
IGl0IG1heSB3ZWxsIGJlIHRoYXQgaXQgaXMgcXVpY2tlciBmb3IgdGhlCm1lbW9yeSBjb250cm9s
bGVyIHRvIGdldCB0aGUgdGFncyBmcm9tIEVDQyBiaXRzIHRoYW4gdmlhIHNvbWUgb3RoZXIKbWVh
bnMsIGJ1dCB5b3XigJlyZSBhbHJlYWR5IHBheWluZyBtYW55IG1hbnkgY3ljbGVzIGF0IHRoYXQg
cG9pbnQsIHdpdGgKdGhlIHJlbGV2YW50IHN0b3JlIGJlaW5nIHN0dWNrIHVuYWJsZSB0byByZXRp
cmUgKGFuZCB0aHVzIGV2ZXJ5Cmluc3RydWN0aW9uIGFmdGVyIGl0IGluIHRoZSBpbnN0cnVjdGlv
biBzdHJlYW0pIHRoYXQgd2hvbGUgdGltZSwgYW5kIG5vCndyaXRlIGFsbG9jYXRlIG9yIHdyaXRl
IGFyb3VuZCBzY2hlbWVzIGNhbiBoZWxwIHlvdSwgYmVjYXVzZSB5b3UKZnVuZGFtZW50YWxseSBo
YXZlIHRvIHdhaXQgZm9yIHRoZSB0YWdzIHRvIGJlIHJlYWQgYmVmb3JlIHlvdSBrbm93IGlmCnRo
ZSBpbnN0cnVjdGlvbiBpcyBnb2luZyB0byB0cmFwLgoKTm93LCB5b3UgY2FuIGNob29zZSB0byBu
b3QgdXNlIHN5bmNocm9ub3VzIG1vZGUgZHVlIHRvIHRoYXQgb3ZlcmhlYWQsCmJ1dCB0aGF04oCZ
cyBudWFuY2UgdGhhdCBpc27igJl0IGNvbnNpZGVyZWQgYnkgeW91ciByZXBseSBoZXJlIGFuZCBo
YXMgc29tZQpjb25zZXF1ZW5jZXMuCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
