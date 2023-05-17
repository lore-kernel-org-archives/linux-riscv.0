Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDB3C7EE24
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 03:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NcqDUR52F2mepXZcRRDnC6KCEwpXUsrzEDsrUHWmna8=; b=K2a+yZp4x+zZQ6
	ydBY6j8liCBHoRBEzpei1ZdFMtyn3H4tcBL1+R9bk8qfhcKb9/mZvotV2yaxYwGhB5VhhE8cKjHHc
	zdcuWIqdp529Qpzb2napDDs1RsAK8WHS3N6O12qynLHQs5iZ2Z1cXVMNCeSoZze+Q+NNgqHx/zks9
	mJKrUnHn3AinWLaJt2nPYTDC4OMn0ED01oMZgE7DdAm44tXWIkMcZZI+lPstD82aE/NcIz8FYbgKd
	vtp155m2N4GH3uDXLY73a7ti08xepRAkOey23p4J/XYtYB7Dx4z8ugPyuupySZgPN+hVi0xt6KH9p
	VK7hJkhdVelKGP4X1Obw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7Yl-007wCI-1b;
	Wed, 17 May 2023 03:10:39 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7Yj-007wAF-0H
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 03:10:38 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-510bcd2d6b8so2697301a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 20:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684293033; x=1686885033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pTSSDCaJ7lg+mm+c1srKGW468miK1XyKNdzeJHhyA4=;
        b=I+9fckyUF5DFOB6kouKDdUAmllDqQc/QcYTLG04b1K0QXMyqFH5nnQjIM6IaV5FrfE
         9o1FW9Kv5QKwd/b/XosujS90FzOmEGOxbLfFzpgDNB7shG1AI9AkMYhlRzjXqarJ557x
         zXm/VNz50OcuKrIWifJNvjToTwj6BUCVsMXU174tk3lL5idWChdZQuqOZgZf/Y0gg6ZG
         JTmWJ1ruoTgN/IGHBby+zPT5PJiduLY+v84V7kWaWiBXjcFM/VB52HWOqHLi0J0yxxXK
         MaqzP6Ja9YE2dfeF6AKzQTN/Bgfa3WOPzdrHWHqY0FKWJyCvbMDUA0cDg+9Sjo/KeM/q
         wLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684293033; x=1686885033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pTSSDCaJ7lg+mm+c1srKGW468miK1XyKNdzeJHhyA4=;
        b=Z77o5ohQkiTjNoFpuICZY6p2XmJwTWkd+rM82FUs8lj1rFip0Ju2k2L5mTGtROR9JW
         YuilnNjYOlY0i7gQUJwzNNbc0QsLJfP7HoseUS5aPydXDbXI+UoLUztPgRw4xZ7g0Eu1
         hMlOwPj1frL4bYo75i1HwU/FQuzm5LsR8Kd1kXMfOXGrPybnNFPuV4OeRAbKUemRv0d7
         fvOrGzYgoRaa6Fl5smkfDq1yh0/8eUXZYqhY70FFvz4ft27pYexFqDB6PdMks8//fWtl
         psPm/kMa0c2fozNZZTQ4bggeQDnoUelgFOB7q3Md5ppap588tA93j/FPX6Em1PUwNOaw
         fSPg==
X-Gm-Message-State: AC+VfDxooWAPXpRkuIh5A8wAIY4n26OrRXvuCBgUYTR9eZANJU8jxDjZ
	GOtPMbK+ao+Zrzj2eopHOHqYmEtQK1tsiU6zIqN3ugSK5j0RMA==
X-Google-Smtp-Source: ACHHUZ5Y5JiuuaffuRZQsJfvcnMH3GABSYBQ500yWJBzQa8Yn/drbPzcBo6ii1dLFh7aQZEdgHIVR3eI2pIheciedjI=
X-Received: by 2002:a05:6402:2807:b0:506:b94f:3d8f with SMTP id
 h7-20020a056402280700b00506b94f3d8fmr721226ede.5.1684293033169; Tue, 16 May
 2023 20:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230516071830.8190-1-zegao@tencent.com> <20230516071830.8190-3-zegao@tencent.com>
 <20230516091820.GB2587705@hirez.programming.kicks-ass.net>
 <CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
 <20230517010311.f46db3f78b11cf9d92193527@kernel.org> <CAD8CoPAw_nKsm4vUJ_=aSwzLc5zo8D5pY6A7-grXENxpMYz9og@mail.gmail.com>
 <20230517115432.94a65364e53cbd5b40c54e82@kernel.org>
In-Reply-To: <20230517115432.94a65364e53cbd5b40c54e82@kernel.org>
From: Ze Gao <zegao2021@gmail.com>
Date: Wed, 17 May 2023 11:10:21 +0800
Message-ID: <CAD8CoPC0BXB2ER_Oaixm5XgMk8TTqKVVF7Po0t4gBPOLhw_xwQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion free
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Ze Gao <zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_201037_126028_3FB95D51 
X-CRM114-Status: GOOD (  26.21  )
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

R290IGl0ISA6KQoKSSB3aWxsIGltcHJvdmUgdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBzZW5kIHYz
IEFTQVAuCgpCVFcsIHdoaWNoIHRyZWUgc2hvdWxkIEkgcmViYXNlIHRob3NlIHBhdGNoZXMgb250
bz8gSXMgdGhhdCB0aGUKZm9yLW5leHQgYnJhbmNoIG9mCmdpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90cmFjZS9saW51eC10cmFjZS5naXQuIEkgc2F3CkppcmkgaGFkIHRy
b3VibGVzCmFwcGx5aW5nIHRob3NlIHNpbmNlIHRoZXNlIHdvcmtzIGFyZSBiYXNlZCBvbiB2Ni40
LjAuCgpUSFgsClplCgpPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAxMDo1NOKAr0FNIE1hc2FtaSBI
aXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCAxNyBNYXkg
MjAyMyAwOTo1NDo1MyArMDgwMAo+IFplIEdhbyA8emVnYW8yMDIxQGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiA+IE9vcHMsIEkgbWlzdW5kZXJzdG9vZCB5b3VyIGNvbW1lbnRzIGJlZm9yZS4KPiA+Cj4g
PiBZZXMsIGl0J3Mgbm90IG5lY2Vzc2FyeSB0byBkbyB0aGlzIHJlb3JkZXJpbmcgYXMgcmVnYXJk
cyB0byBrcHJvYmUuCj4KPiBMZXQgbWUgY29uZmlybSwgSSBtZWFudCB0aGF0IHlvdXIgY3VycmVu
dCBwYXRjaCBpcyBjb3JyZWN0LiBJIGp1c3QgbWVudGlvbmVkCj4gdGhhdCBrcHJvYmVfYnVzeV97
YmVnaW4sZW5kfSB3aWxsIGNvbnRpbnVlIHVzZSBzdGFuZGFyZCB2ZXJzaW9uIGJlY2F1c2UKPiBr
cHJvYmUgaXRzZWxmIGhhbmRsZXMgdGhhdC4gUGxlYXNlIHVwZGF0ZSBvbmx5IHRoZSBwYXRjaCBk
ZXNjcmlwdGlvbiBhbmQKPiBhZGQgbXkgYWNrLgo+Cj4gQWNrZWQtYnk6IE1hc2FtaSBIaXJhbWF0
c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+Cj4KPiBJZiB5b3UgYWRkIFN0ZXZlJ3Mg
Y2FsbCBncmFwaCBmb3IgdGhlIGV4cGxhbmF0aW9uLCBpdCB3aWxsIGhlbHAgdXMgdG8KPiB1bmRl
cnN0YW5kIHdoYXQgd2lsbCBiZSBmaXhlZC4KPgo+IFRoYW5rIHlvdSwKPgo+ID4KPiA+IFRoYW5r
cyBmb3IgeW91ciByZXZpZXcuCj4gPgo+ID4gSSdsbCByZWJhc2Ugb250byB0aGUgbGF0ZXN0IHRy
ZWUgYW5kIHNlbmQgdjMgQVNBUC4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gWmUKPiA+Cj4gPiBPbiBX
ZWQsIE1heSAxNywgMjAyMyBhdCAxMjowM+KAr0FNIE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUdWUsIDE2IE1heSAyMDIzIDE3OjQ3
OjUyICswODAwCj4gPiA+IFplIEdhbyA8emVnYW8yMDIxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+
Cj4gPiA+ID4gUHJlY2lzZWx5LCB0aGVzZSB0aGF0IGFyZSBjYWxsZWQgd2l0aGluIGtwcm9iZV9i
dXN5X3tiZWdpbiwgZW5kfSwKPiA+ID4gPiB3aGljaCB0aGUgcHJldmlvdXMgcGF0Y2ggZG9lcyBu
b3QgcmVzb2x2ZS4KPiA+ID4KPiA+ID4gTm90ZSB0aGF0IGtwcm9iZV9idXN5X3tiZWdpbixlbmR9
IGRvbid0IG5lZWQgdG8gdXNlIG5vdHJhY2UgdmVyc2lvbgo+ID4gPiBiZWNhdXNlIGtwcm9iZSBp
dHNlbGYgcHJvaGliaXRzIHByb2Jpbmcgb24gcHJlZW1wdF9jb3VudF97YWRkLHN1Yn0uCj4gPiA+
Cj4gPiA+IFRoYW5rIHlvdSwKPiA+ID4KPiA+ID4gPiBJIHdpbGwgcmVmaW5lIHRoZSBjb21taXQg
bWVzc2FnZSB0byBtYWtlIGl0IGNsZWFyLgo+ID4gPiA+Cj4gPiA+ID4gRllJLCBkZXRhaWxzIGNh
biBjaGVja2VkIG91dCBoZXJlOgo+ID4gPiA+ICAgICBMaW5rOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC10cmFjZS1rZXJuZWwvMjAyMzA1MTYxMzI1MTYuYzkwMmVkY2YyMTAyODg3NGE3
NGZiODY4QGtlcm5lbC5vcmcvCj4gPiA+ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IFplCj4g
PiA+ID4KPiA+ID4gPiBPbiBUdWUsIE1heSAxNiwgMjAyMyBhdCA1OjE44oCvUE0gUGV0ZXIgWmlq
bHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBP
biBUdWUsIE1heSAxNiwgMjAyMyBhdCAwMzoxODoyOFBNICswODAwLCBaZSBHYW8gd3JvdGU6Cj4g
PiA+ID4gPiA+IEN1cnJlbnQgaW1wbGVtZW50YXRpb24gY2FsbHMga3Byb2JlIHJlbGF0ZWQgZnVu
Y3Rpb25zIGJlZm9yZSBkb2luZwo+ID4gPiA+ID4gPiBmdHJhY2UgcmVjdXJzaW9uIGNoZWNrIGlu
IGZwcm9iZV9rcHJvYmVfaGFuZGxlciwgd2hpY2ggb3BlbnMgZG9vcgo+ID4gPiA+ID4gPiB0byBr
ZXJuZWwgY3Jhc2ggZHVlIHRvIHN0YWNrIHJlY3Vyc2lvbiBpZiBwcmVlbXB0X2NvdW50X3thZGQs
IHN1Yn0KPiA+ID4gPiA+ID4gaXMgdHJhY2VhYmxlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdoaWNo
IHByZWVtcHRfY291bnQqKCkgYXJlIHlvdSByZWZlcnJpbmcgdG8/IFRoZSBvbmVzIHlvdSBqdXN0
IG1hZGUKPiA+ID4gPiA+IF9ub3RyYWNlIGluIHRoZSBwcmV2aW91cyBwYXRjaD8KPiA+ID4KPiA+
ID4KPiA+ID4gLS0KPiA+ID4gTWFzYW1pIEhpcmFtYXRzdSAoR29vZ2xlKSA8bWhpcmFtYXRAa2Vy
bmVsLm9yZz4KPgo+Cj4gLS0KPiBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIDxtaGlyYW1hdEBr
ZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
