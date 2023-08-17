Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9856BC2FC04
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 04:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNBqxrtmXXex/zD9ls6cyY/pFyyNegx6NEZlFRX/Ofw=; b=MMImaNGnAj1qdz
	VHxVKOAqALyt9getqVcad87/PfYm7QMEEUZpIigS0vqGqjfr5FJ/Z+HBJyBSIQbuVFDdNSozuX9gn
	v6owS9Apy7f2UIWv+7u1Ya3w4kbbv7Hasixjt2asj4g60mwYQnKREn4JqqV5MTHVhVcHQ5S6ZIlvN
	17+GhOGqhHX+BVRNoPj0iurt22H0lIEmSfpGE/yn8SgHZEAfVPlKhC+s0I0exDXH/+nnv65b3CgSK
	l2HeuV4S89jeA2F0jYDt0MfR68veeBszVFY7JFARbttdeAkaAZmiOgYhOGRq5xJ1VsHWXu0J13oWf
	a0PHwREJ57yTAFvZwVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWUGr-005VNg-0Y;
	Thu, 17 Aug 2023 04:06:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWUGn-005VME-1c
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 04:06:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-319559fd67dso5547686f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Aug 2023 21:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1692245157; x=1692849957;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPAvUFmMc6MHYhPtcS+J2Wjm5R9zwPAqvH6XS/X0hao=;
        b=DOx//VT3uLRhMKZN1gvZ1e26MR0GD7yjJ1Uh+tgiJ+j0T+pf111e0oMTmi8jmQJZxn
         Xfo8mfRy6RIEBDYYhD2/32oqIKdUL649MurhO4POndlvLkJ3bM9V+USg+Hrx/Z+kexZq
         7hvC/W+pUlWMG4lleGbE3G20NaHhNwpnf7dB+1T1n2inx09RFpX+CK9hjSjieUkelE9T
         jwHmeU1WHzYErWj/Tch/cK2mM8RN5N+xMiY3xnehx8OSGnTIYFMW8vk068IC8r8uvwaD
         0v6Pw/SGwnilyihfyQTh19Fp3SFjpw9jocPMNod+RiquXGvkiyBSgAsaRMlSCzZd5/96
         71ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692245157; x=1692849957;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPAvUFmMc6MHYhPtcS+J2Wjm5R9zwPAqvH6XS/X0hao=;
        b=JvsqFgip9NKWIbIT1MHztizdLKH+37hu3/+d0+upXd5gYl3Y34FRF8PP0Q9fsQW6wm
         JP3kdw/Lk/XjAiqieL8eapHOKn14TSWCLCRsRENR/ShSBS5jhcf8FqaWC6hSrcCUEMzD
         x6z6lCDBxLJNy5/iZ2oHXSmtBG+oRvbK6ic8wh1jDK3N79v08R95187hIxnnIJbKGN3r
         gtaT+LrIrpV3exktY/8CyUTHKLQSYRATY68U8itFmJHAU4ZKeePoAXDq18Y0kSxRI7s3
         zxkR9f8DgE0Z1iHwc7VLkWLh4xxj2HydBCLKteCmME47OLZU0o5fKJb4SLgWIhNaPzd3
         4+vQ==
X-Gm-Message-State: AOJu0YxXPfdOO/zIepHAloNsfiglsnHMFPGUSq9WyJlSdrenTCJSnwrr
	K4EKcpL/ZLVaeflilQXQJluOqg==
X-Google-Smtp-Source: AGHT+IG7M1cue9DEYwFoKSeGNCqOcVuwwMifdF7sqjo7y0IqOhjGcIK5XPaod2BNxeerL82qeVFCEA==
X-Received: by 2002:a05:6000:cd:b0:317:5e5e:60e0 with SMTP id q13-20020a05600000cd00b003175e5e60e0mr2939290wrx.28.1692245157358;
        Wed, 16 Aug 2023 21:05:57 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id j2-20020adfff82000000b003195504c754sm21581512wrr.31.2023.08.16.21.05.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Aug 2023 21:05:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 00/10] RISC-V: Refactor instructions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <12FAB5A9-5723-4A5B-8729-75D8A38921B9@jrtc27.com>
Date: Thu, 17 Aug 2023 05:05:45 +0100
Cc: Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org,
 bpf@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>,
 Nam Cao <namcaov@gmail.com>
Message-Id: <46884D2C-F3AA-4A83-8295-AE5C0F58FE13@jrtc27.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230804-2c57bddd6e87fdebc20ff9d5@orel> <ZM00UYDzEAz/JT3n@ghost>
 <ZN1qXlLp6qfpBeGF@ghost> <12FAB5A9-5723-4A5B-8729-75D8A38921B9@jrtc27.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_210601_542233_EDC68DAF 
X-CRM114-Status: GOOD (  27.45  )
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

T24gMTcgQXVnIDIwMjMsIGF0IDA0OjU3LCBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpydGMyNy5j
b20+IHdyb3RlOgo+IAo+IE9uIDE3IEF1ZyAyMDIzLCBhdCAwMTozMSwgQ2hhcmxpZSBKZW5raW5z
IDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiBGcmksIEF1ZyAwNCwgMjAy
MyBhdCAxMDoyNDozM0FNIC0wNzAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4+PiBPbiBGcmks
IEF1ZyAwNCwgMjAyMyBhdCAxMjoyODoyOFBNICswMzAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+
Pj4gT24gVGh1LCBBdWcgMDMsIDIwMjMgYXQgMDc6MTA6MjVQTSAtMDcwMCwgQ2hhcmxpZSBKZW5r
aW5zIHdyb3RlOgo+Pj4+PiBUaGVyZSBhcmUgbnVtZXJvdXMgc3lzdGVtcyBpbiB0aGUga2VybmVs
IHRoYXQgcmVseSBvbiBkaXJlY3RseQo+Pj4+PiBtb2RpZnlpbmcsIGNyZWF0aW5nLCBhbmQgcmVh
ZGluZyBpbnN0cnVjdGlvbnMuIE1hbnkgb2YgdGhlc2Ugc3lzdGVtcwo+Pj4+PiBoYXZlIHJld3Jp
dHRlbiBjb2RlIHRvIGRvIHRoaXMuIFRoaXMgcGF0Y2ggd2lsbCBkZWxlZ2F0ZSBhbGwgaW5zdHJ1
Y3Rpb24KPj4+Pj4gaGFuZGxpbmcgaW50byBpbnNuLmggYW5kIHJlZy5oLiBBbGwgb2YgdGhlIGNv
bXByZXNzZWQgaW5zdHJ1Y3Rpb25zLCBSVkksCj4+Pj4+IFppY3NyLCBNLCBBIGluc3RydWN0aW9u
cyBhcmUgaW5jbHVkZWQsIGFzIHdlbGwgYXMgYSBzdWJzZXQgb2YgdGhlIEYsRCxRCj4+Pj4+IGV4
dGVuc2lvbnMuCj4+Pj4+IAo+Pj4+PiAtLS0KPj4+Pj4gVGhpcyBpcyBtb2RpZnlpbmcgY29kZSB0
aGF0IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMzA3MzExODM5MjUuMTUyMTQ1LTEt
bmFtY2FvdkBnbWFpbC5jb20vCj4+Pj4+IGlzIGFsc28gdG91Y2hpbmcuCj4+Pj4+IAo+Pj4+PiAt
LS0KPj4+Pj4gVGVzdGluZzoKPj4+Pj4gCj4+Pj4+IFRoZXJlIGFyZSBhIGxvdCBvZiBzdWJzeXN0
ZW1zIHRvdWNoZWQgYW5kIEkgaGF2ZSBub3QgdGVzdGVkIGV2ZXJ5Cj4+Pj4+IGluZGl2aWR1YWwg
aW5zdHJ1Y3Rpb24uIEkgZGlkIGEgbG90IG9mIGNvcHktcGFzdGluZyBmcm9tIHRoZSBSSVNDLVYg
c3BlYwo+Pj4+PiBzbyBvcGNvZGVzIGFuZCBzdWNoIHNob3VsZCBiZSBjb3JyZWN0Cj4+Pj4gCj4+
Pj4gSG93IGFib3V0IHdlIGNyZWF0ZSBtYWNyb3Mgd2hpY2ggZ2VuZXJhdGUgZWFjaCBvZiB0aGUg
ZnVuY3Rpb25zIGFuCj4+Pj4gaW5zdHJ1Y3Rpb24gbmVlZHMsIGUuZy4gcmlzY3ZfaW5zbl9pc18q
KCksIGV0Yy4gYmFzZWQgb24gdGhlIG91dHB1dCBvZgo+Pj4+IFsxXS4gSSBrbm93IGJhc2ljYWxs
eSBub3RoaW5nIGFib3V0IHRoYXQgcHJvamVjdCwgYnV0IGl0IGxvb2tzIGxpa2UgaXQKPj4+PiBj
cmVhdGVzIG1vc3QgdGhlIGRlZmluZXMgdGhpcyBzZXJpZXMgaXMgY3JlYXRpbmcgZnJvbSB3aGF0
IHdlIFtob3BlXSB0bwo+Pj4+IGJlIGFuIGF1dGhvcml0YXRpdmUgc291cmNlLiBJIGFsc28gYXNz
dW1lIHRoYXQgaWYgd2UgZG9uJ3QgbGlrZSB0aGUKPj4+PiBjdXJyZW50IG91dHB1dCBmb3JtYXQs
IHRoZW4gd2UgY291bGQgcHJvYmFibHkgcG9zdCBwYXRjaGVzIHRvIHRoZSBwcm9qZWN0Cj4+Pj4g
dG8gZ2V0IHRoZSBmb3JtYXQgd2Ugd2FudC4gRm9yIGV4YW1wbGUsIHdlIGNvdWxkIG1heWJlIHBy
b3Bvc2UgYW4gImxjIgo+Pj4+IGZvcm1hdCBmb3IgIkxpbnV4IEMiLgo+Pj4gVGhhdCdzIGEgZ3Jl
YXQgaWRlYSwgSSBkaWRuJ3QgcmVhbGl6ZSB0aGF0IGV4aXN0ZWQhCj4+IEkgaGF2ZSBkaXNjb3Zl
cmVkIHRoYXQgdGhlIHJpc2N2LW9wY29kZXMgcmVwb3NpdG9yeSBpcyBub3QgaW4gYSBzdGF0ZQo+
PiB0aGF0IG1ha2VzIGl0IGhlbHBmdWwuIElmIGl0IHdlcmUgd29ya2FibGUsIGl0IHdvdWxkIG1h
a2UgaXQgZWFzeSB0bwo+PiBpbmNsdWRlIGEgIkxpbnV4IEMiIGZvcm1hdC4gSSBoYXZlIGhhZCBh
IHB1bGwgcmVxdWVzdCBvcGVuIG9uIHRoZSByZXBvCj4+IGZvciB0d28gd2Vla3Mgbm93IGFuZCB0
aGUgcGVyc29uIHdobyBtYWludGFpbnMgdGhlIHJlcG8gaGFzIG5vdAo+PiBpbnRlcmFjdGVkLgo+
IAo+IEh1aD8gQW5kcmV3IGhhcyByZXBsaWVkIHRvIHlvdSB0d2ljZSBvbiB5b3VyIFBSLCBhbmQg
d2FzIHRoZSBsYXN0IG9uZSB0bwo+IGNvbW1lbnQuIFRoYXTigJlzIGhhcmRseSDigJxoYXMgbm90
IGludGVyYWN0ZWTigJ0uCj4gCj4+IEF0IG1pbmltdW0sIGluIG9yZGVyIGZvciBpdCB0byBiZSB1
c2VmdWwgaXQgd291bGQgbmVlZCBhbiBhYmlsaXR5IHRvCj4+IGRlc2NyaWJlIHRoZSBiaXQgb3Jk
ZXIgb2YgaW1tZWRpYXRlcyBpbiBhbiBpbnN0cnVjdGlvbiBhbmQgaW5jbHVkZSBzY3JpcHQKPj4g
YXJndW1lbnRzIHRvIHNlbGVjdCB3aGljaCBpbnN0cnVjdGlvbnMgc2hvdWxkIGJlIGluY2x1ZGVk
LiBUaGVyZSBpcyBhCj4+ICJDIiBmb3JtYXQsIGJ1dCBpdCBpcyBhY3R1YWxseSBqdXN0IGEgU3Bp
a2UgZm9ybWF0Lgo+IAo+IFNvIGV4dGVuZCBpdD8gT3IgZG8gc29tZXRoaW5nIHdpdGggUUVNVeKA
mXMgZXF1aXZhbGVudCB0aGF0IGV4cHJlc3NlcyBpdC4KCk5vdGUgdGhhdCBldmVyeSBmaWVsZCBh
bHJlYWR5IGlkZW50aWZpZXMgdGhlIGJpdCBvcmRlciAob3IsIGZvciB0aGUKY2FzZSBvZiBjb21w
cmVzc2VkIGluc3RydWN0aW9ucywgcmVnaXN0ZXIgcmVzdHJpY3Rpb25zKSBzaW5jZSB0aGF04oCZ
cwpuZWVkZWQgdG8gcHJvZHVjZSB0aGUgb2xkIExhVGVYIGluc3RydWN0aW9uIHNldCBsaXN0aW5n
czsgdGhhdOKAmXMgd2h5CnRoZXJl4oCZcyBqaW1tMjAgdnMgaW1tMjAsIGZvciBleGFtcGxlLiBP
bmUgY291bGQgc3VyZWx5IGVuY29kZSB0aGF0IGluClB5dGhvbiBhbmQgZ2VuZXJhdGUgdGhlIExh
VGVYIHN0cmluZ3MgZnJvbSB0aGUgUHl0aG9uLCBtYWtpbmcgdGhlCmRldGFpbHMgb2YgdGhlIGVu
Y29kaW5ncyBhdmFpbGFibGUgZWxzZXdoZXJlLiBPciBqdXN0IGhhdmUgeW91ciBvd24KbWFwcGlu
ZyBmcm9tIG5hbWUgdG8gd2hhdGV2ZXIgeW91IG5lZWQuIEJ1dCwgZWl0aGVyIHdheSwgdGhlCmlu
Zm9ybWF0aW9uIHNob3VsZCBhbGwgYmUgdGhlcmUgdG9kYXkgaW4gdGhlIGlucHV0IGZpbGVzLCBp
dOKAmXMganVzdCBhCm1hdHRlciBvZiBleHRlbmRpbmcgdGhlIHNjcmlwdCB0byBwcm9kdWNlIHdo
YXRldmVyIHlvdSB3YW50IGZyb20gdGhlbS4KCj4gSmVzcwo+IAo+PiBOb25ldGhlbGVzcywgaXQK
Pj4gc2VlbXMgbGlrZSBpdCBpcyBwcm9oaWJpdGl2ZSB0byB1c2UgaXQuCj4+Pj4gCj4+Pj4gSSdk
IGFsc28gcmVjb21tZW5kIG9ubHkgaW1wb3J0aW5nIHRoZSBnZW5lcmF0ZWQgZGVmaW5lcyBhbmQg
Z2VuZXJhdGluZwo+Pj4+IHRoZSBmdW5jdGlvbnMgdGhhdCB3aWxsIGFjdHVhbGx5IGhhdmUgaW1t
ZWRpYXRlIGNvbnN1bWVycyBvciBhcmUgcGFydCBvZgo+Pj4+IGEgc2V0IG9mIGRlZmluZXMgdGhh
dCBoYXZlIGltbWVkaWF0ZSBjb25zdW1lcnMuIEVhY2ggY29uc3VtZXIgb2YgbmV3Cj4+Pj4gaW5z
dHJ1Y3Rpb25zIHdpbGwgYmUgcmVzcG9uc2libGUgZm9yIGdlbmVyYXRpbmcgYW5kIGltcG9ydGlu
ZyB0aGUgZGVmaW5lcwo+Pj4+IGFuZCBhZGRpbmcgdGhlIHJlc3BlY3RpdmUgbWFjcm8gaW52b2Nh
dGlvbnMgdG8gZ2VuZXJhdGUgdGhlIGZ1bmN0aW9ucy4KPj4+PiBUaGlzIHNlcmllcyBjYW4gYWxz
byB0YWtlIHRoYXQgYXBwcm9hY2gsIGkuZS4gY29udmVydCBvbmUgc2V0IG9mCj4+Pj4gaW5zdHJ1
Y3Rpb25zIGF0IGEgdGltZSwgZWFjaCBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+Pj4gU2luY2UgSSB3
YXMgaGFuZC13cml0aW5nIGV2ZXJ5dGhpbmcgYW5kIGNvcHlpbmcgaXQgd2Fzbid0IHRvbyBtdWNo
Cj4+PiBlZmZvcnQgdG8ganVzdCBjb3B5IGFsbCBvZiB0aGUgaW5zdHJ1Y3Rpb25zIGZyb20gYSBn
cm91cC4gSG93ZXZlciwgZnJvbQo+Pj4gYSB0ZXN0aW5nIHN0YW5kcG9pbnQgaXQgbWFrZXMgc2Vu
c2UgdG8gZXhjbHVkZSBpbnN0cnVjdGlvbnMgbm90IHlldCBpbgo+Pj4gdXNlLgo+Pj4+IAo+Pj4+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3Ytb3Bjb2Rlcwo+Pj4+IAo+Pj4+IFRo
YW5rcywKPj4+PiBkcmV3Cj4+Pj4gCj4+Pj4gCj4+Pj4+ICwgYnV0IHRoZSBjb25zdHJ1Y3Rpb24g
b2YgZXZlcnkKPj4+Pj4gaW5zdHJ1Y3Rpb24gaXMgbm90IGZ1bGx5IHRlc3RlZC4KPj4+Pj4gCj4+
Pj4+IHZlY3RvcjogQ29tcGlsZWQgYW5kIGJvb3RlZAo+Pj4+PiAKPj4+Pj4ganVtcF9sYWJlbDog
RW5zdXJlZCBzdGF0aWMga2V5cyBmdW5jdGlvbiBhcyBleHBlY3RlZC4KPj4+Pj4gCj4+Pj4+IGtn
ZGI6IEF0dGVtcHRlZCB0byBydW4gdGhlIHByb3ZpZGVkIHRlc3RzIGJ1dCB0aGV5IGZhaWxlZCBl
dmVuIHdpdGhvdXQKPj4+Pj4gbXkgY2hhbmdlcwo+Pj4+PiAKPj4+Pj4gbW9kdWxlOiBMb2FkZWQg
YW5kIHVubG9hZGVkIG1vZHVsZXMKPj4+Pj4gCj4+Pj4+IHBhdGNoLmM6IEVuc3VyZWQga2VybmVs
IGJvb3RlZAo+Pj4+PiAKPj4+Pj4ga3Byb2JlczogVXNlZCBhIGtwcm9iaW5nIG1vZHVsZSB0byBw
cm9iZSBqYWxyLCBhdWlwYywgYW5kIGJyYW5jaAo+Pj4+PiBpbnN0cnVjdGlvbnMKPj4+Pj4gCj4+
Pj4+IG5vbW11IG1pc2FsaWduZWQgYWRkcmVzc2VzOiBLZXJuZWwgYm9vdHMKPj4+Pj4gCj4+Pj4+
IGt2bTogUmFuIEtWTSBzZWxmdGVzdHMKPj4+Pj4gCj4+Pj4+IGJwZjogS2VybmVsIGJvb3RzLiBN
b3N0IG9mIHRoZSBpbnN0cnVjdGlvbnMgYXJlIGV4Y2x1c2l2ZWx5IHVzZWQgYnkgQlBGCj4+Pj4+
IGJ1dCBJIGFtIHVuc3VyZSBvZiB0aGUgYmVzdCB3YXkgb2YgdGVzdGluZyBCUEYuCj4+Pj4+IAo+
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29t
Pgo+Pj4+PiAKPj4+Pj4gLS0tCj4+Pj4+IENoYXJsaWUgSmVua2lucyAoMTApOgo+Pj4+PiAgICAg
UklTQy1WOiBFeHBhbmQgaW5zdHJ1Y3Rpb24gZGVmaW5pdGlvbnMKPj4+Pj4gICAgIFJJU0MtVjog
dmVjdG9yOiBSZWZhY3RvciBpbnN0cnVjdGlvbnMKPj4+Pj4gICAgIFJJU0MtVjogUmVmYWN0b3Ig
anVtcCBsYWJlbCBpbnN0cnVjdGlvbnMKPj4+Pj4gICAgIFJJU0MtVjogS0dEQjogUmVmYWN0b3Ig
aW5zdHJ1Y3Rpb25zCj4+Pj4+ICAgICBSSVNDLVY6IG1vZHVsZTogUmVmYWN0b3IgaW5zdHJ1Y3Rp
b25zCj4+Pj4+ICAgICBSSVNDLVY6IFJlZmFjdG9yIHBhdGNoIGluc3RydWN0aW9ucwo+Pj4+PiAg
ICAgUklTQy1WOiBub21tdTogUmVmYWN0b3IgaW5zdHJ1Y3Rpb25zCj4+Pj4+ICAgICBSSVNDLVY6
IGt2bTogUmVmYWN0b3IgaW5zdHJ1Y3Rpb25zCj4+Pj4+ICAgICBSSVNDLVY6IGJwZjogUmVmYWN0
b3IgaW5zdHJ1Y3Rpb25zCj4+Pj4+ICAgICBSSVNDLVY6IFJlZmFjdG9yIGJ1ZyBhbmQgdHJhcHMg
aW5zdHJ1Y3Rpb25zCj4+Pj4+IAo+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2J1Zy5oICAg
ICAgICAgICAgIHwgICAxOCArLQo+Pj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24uaCAg
ICAgICAgICAgIHwgMjc0NCArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPj4+Pj4gYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9yZWcuaCAgICAgICAgICAgICB8ICAgODggKwo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC9qdW1wX2xhYmVsLmMgICAgICAgICAgIHwgICAxMyArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC9rZ2RiLmMgICAgICAgICAgICAgICAgIHwgICAxMyArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC9tb2R1bGUuYyAgICAgICAgICAgICAgIHwgICA4MCArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jICAgICAgICAgICAgICAgIHwgICAgMyArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jICAgICAgIHwgICAxMyArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5jIHwgIDEwMCArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jICAgICAgIHwgICAgNSArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jICAgICAgICAgICAgICAgIHwgICAgOSArLQo+Pj4+PiBhcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgICAgIHwgIDIxOCArLS0KPj4+Pj4gYXJj
aC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAgICAgICB8ICAgIDUgKy0KPj4+Pj4gYXJj
aC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgICAgICAgICAgICAgICB8ICAyODEgKy0tCj4+Pj4+IGFy
Y2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAgICAgICAgICAgICAgfCAgNzA3ICstLS0tLS0tCj4+
Pj4+IDE1IGZpbGVzIGNoYW5nZWQsIDI4MjUgaW5zZXJ0aW9ucygrKSwgMTQ3MiBkZWxldGlvbnMo
LSkKPj4+Pj4gLS0tCj4+Pj4+IGJhc2UtY29tbWl0OiA1ZDBjMjMwZjFkZThjNzUxNWI2NTY3ZDlh
ZmJhMWYxOTZmYjRlMmY0Cj4+Pj4+IGNoYW5nZS1pZDogMjAyMzA4MDEtbWFzdGVyLXJlZmFjdG9y
LWluc3RydWN0aW9ucy12NC00MzNhYTA0MGRhMDMKPj4+Pj4gLS0gCj4+Pj4+IC0gQ2hhcmxpZQo+
Pj4+PiAKPj4+Pj4gCj4+Pj4+IC0tIAo+Pj4+PiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4+Pj4+
IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cj4+IAo+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
