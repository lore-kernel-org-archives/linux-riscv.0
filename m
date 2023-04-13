Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55014C77B6E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 16:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfI5b4uFISv64aWOQJRecK0f9gLZH2ZcBbMQ5uxPYAE=; b=0ZB4HrB1/opJBL
	DcuMEw0xXKZpuIUAQx9ZCkpHLrvlESyuPwCdQQozfaI0uAi+/XXkUIYbcD4OS6bxGQPm3ZbJyws+P
	PRnuLYukH7JV0/BsoBcWWBe9VNkhzotooNc0bmHBPJUlAwg6bVG68OEQgaa7Q/hc0Xhlige2QE9Z6
	U0Zp+hOHV1Yf5iIRdxue0P8ctoz1WDbi4G5iPUuZ8p/ILaj31mybr3NRPI5UxOtJKiGdoW6q7HtG6
	dpaUd8QdA9AlSvOXCH0aIMY3N8ls4k6Tb/z1WqIy9L9jCGJogKFH2zLoL9E6nmyQWXWl3pJRbvM3Q
	F+XC4ajnr4Bt8mNp2+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzwA-006gu7-2i;
	Thu, 13 Apr 2023 16:36:42 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzw8-006gsT-0C
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 16:36:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f04275b2bdso104325e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 09:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681403795; x=1683995795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Luz0Qw0w9ZqnvhFtzZjcXX6GzM1RqYDZy0O1Aw36Dho=;
        b=KJY7IATIbGi514kJ7FRgfvPH9tgEmqo9KPyiQPUGil2KvhdD62ffqRe6SWY/E8f+nR
         S9h5/DMAAqtdcMbcCeInOxViyL44v/SfjGY6qWFOHzFeQ/KkU+AtC+3VOuya8yMueOK9
         xZPJCTNC90XXxwGYH39hDdxdpNWd2Tnj2RPHh0Z6v55AXv5V54kc0pZeC0gRamAwz8EC
         hPjPXG1ofsaZd7/0LBlKWDFKWTAL0E852Y7mm9gmvneulSccFEuR4lR3/0PAFq7GHqQl
         5VdAaFoTnOFCtQ7EOYfeSlNF8bM2FS2qbo7GwRxiK1+KUN2v6u1R1rlEwUaOf38EV0D9
         3Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681403795; x=1683995795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Luz0Qw0w9ZqnvhFtzZjcXX6GzM1RqYDZy0O1Aw36Dho=;
        b=Vvngf2V66w8CyRzQJUB5rmLuzMnDKz0JxrQ1l5Scgb7RMKNQCWLlkGA79AlklYf5xt
         RTd/zK+ZJSd/LAa0EbTlHlcXVHxLOiAzE0xMdoxwNUfKeoELunCgV8Hc9Iu6F731laHk
         zw7cMIjq1MxmSRjzSLymYR9EHf5tM/1qpHPCWWFxykFCUBhzsbl3yUfEBc5hUUMyY0XX
         Nf8n7LCYTujsELlp9iL1KMYMqV4x4vgo/j9HSV2PvvOX0L8id0sbmHmnfWSQJ2lEe2rB
         X3JzBmCcY83ScCi/vyIr7hHvz897wCJBj13bmd+4JYcJcdZ3ZrIXzkbbrsOUc696qrD6
         LWGA==
X-Gm-Message-State: AAQBX9eaoqshQ9GC/xmnGToUVco8k+UakE+INznBIGw1lQK/KgM68nB+
	b7S66PIuECqn8kCBxrUYYHr4yZJPSVh5KdY5KDwOHw==
X-Google-Smtp-Source: AKy350ZSieiPnZr/0KXmH0IDRFEF/xE3INgqlezSfSLD/+T+SJfaTt5JUaP752jfm5RWRYGlsgxizNdw/mr0/RvNokw=
X-Received: by 2002:a05:600c:5405:b0:3df:f3cb:e8ce with SMTP id
 he5-20020a05600c540500b003dff3cbe8cemr709159wmb.7.1681403795029; Thu, 13 Apr
 2023 09:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 13 Apr 2023 09:36:23 -0700
Message-ID: <CAP-5=fW3wf8wQ2DyQbKnbsKJhZSdjomxnEp6GGF4Ar7qykZTjQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] riscv: Allow userspace to directly access perf counters
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	paranlee <p4ranlee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_093640_099281_F6A1BBCA 
X-CRM114-Status: GOOD (  13.54  )
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

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgOToxN+KAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiByaXNjdiB1c2VkIHRvIGFsbG93IGRpcmVjdCBh
Y2Nlc3MgdG8gY3ljbGUvdGltZS9pbnN0cmV0IGNvdW50ZXJzLAo+IGJ5cGFzc2luZyB0aGUgcGVy
ZiBmcmFtZXdvcmssIHRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBhbGxvdyB0aGUgdXNlciB0bwo+
IG1tYXAgYW55IGNvdW50ZXIgd2hlbiBhY2Nlc3NlZCB0aHJvdWdoIHBlcmYuIEJ1dCB3ZSBjYW4n
dCBicmVhayB0aGUKPiBleGlzdGluZyBiZWhhdmlvdXIgc28gd2UgaW50cm9kdWNlIGEgc3lzY3Rs
IHBlcmZfdXNlcl9hY2Nlc3MgbGlrZSBhcm02NAo+IGRvZXMsIHdoaWNoIGRlZmF1bHRzIHRvIHRo
ZSBsZWdhY3kgbW9kZSBkZXNjcmliZWQgYWJvdmUuCj4KPiBUaGUgY29yZSBvZiB0aGlzIHBhdGNo
c2V0IGxpZXMgaW4gcGF0Y2ggNCwgdGhlIGZpcnN0IDMgcGF0Y2hlcyBhcmUKPiBzaW1wbGUgZml4
ZXMuCj4KPiBiYXNlLWNvbW1pdC10YWc6IHY2LjMtcmMxCj4KPiBBbGV4YW5kcmUgR2hpdGkgKDQp
Ogo+ICAgcGVyZjogRml4IHdyb25nIGNvbW1lbnQgYWJvdXQgZGVmYXVsdCBldmVudF9pZHgKPiAg
IGluY2x1ZGU6IHJpc2N2OiBGaXggd3JvbmcgaW5jbHVkZSBndWFyZCBpbiByaXNjdl9wbXUuaAo+
ICAgcmlzY3Y6IE1ha2UgbGVnYWN5IGNvdW50ZXIgZW51bSBtYXRjaCB0aGUgSFcgbnVtYmVyaW5n
Cj4gICByaXNjdjogRW5hYmxlIHBlcmYgY291bnRlcnMgdXNlciBhY2Nlc3Mgb25seSB0aHJvdWdo
IHBlcmYKClByZXN1bWFibHkgdGhlIHRlc3QgYWxzbyBuZWVkcyBwYXRjaGluZzoKaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYWNtZS9saW51eC5naXQvdHJl
ZS90b29scy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYz9oPXBlcmYtdG9vbHMtbmV4dCNuMjg3CgpU
aGFua3MsCklhbgoKCj4gIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5y
c3QgfCAgMjMgKysrLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BlcmZfZXZlbnQuaCAgICAg
ICAgIHwgICAzICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2V2ZW50LmMgICAgICAgICAgICAg
IHwgIDY1ICsrKysrKysrKysrCj4gIGRyaXZlcnMvcGVyZi9yaXNjdl9wbXUuYyAgICAgICAgICAg
ICAgICAgICAgfCAgNDIgKysrKysrKysKPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9sZWdhY3ku
YyAgICAgICAgICAgICB8ICAyNCArKysrLQo+ICBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5j
ICAgICAgICAgICAgICAgIHwgMTEzICsrKysrKysrKysrKysrKysrKy0tCj4gIGluY2x1ZGUvbGlu
dXgvcGVyZi9yaXNjdl9wbXUuaCAgICAgICAgICAgICAgfCAgIDkgKy0KPiAgaW5jbHVkZS9saW51
eC9wZXJmX2V2ZW50LmggICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICB0b29scy9saWIvcGVy
Zi9tbWFwLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDY1ICsrKysrKysrKysrCj4gIDEwIGZp
bGVzIGNoYW5nZWQsIDMzMiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3BlcmZfZXZlbnQuYwo+Cj4gLS0KPiAyLjM3
LjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
