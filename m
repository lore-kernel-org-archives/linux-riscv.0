Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23E606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 03:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bygDMgz/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=U5g2Vdh3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2/LioLakNB0y88a7ka/Yw24pbz1KfRR6Iut8CgWfxfo=; b=bygDMgz/CCpbujzbfEw2QqoIAH
	yvsO6FuDoPrxQC2QwOSZsKlGiCefpwYosw01tRmQUlwPNRKPQ85XPtnpGwITOcduwAGyYbqvZMHw1
	VuPVlLqo7bTfMwM2JROcpQcMT1PCyEsZkwNKuDtzN/jHNlYpmA3QJbWL+0Tog49sW/A0IqlBiPrhJ
	2h+X8K1vhsLQPvWQeTkPBnHSUSMhyyQZRxc4a0d5sUPYVmJ0ZB/NtLmttqEL6ZJQlG5jW26QIbng8
	+RG/tNHMoR4hiSb3GHL2vvqIGcRAgAqm97ZMwXOjumtL95WyTVn5XKspL0RKY16jUsUDfUJGttL93
	oQpY/usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGdz-00000008F4E-3Bh5;
	Thu, 29 Oct 2026 03:17:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMGdw-00000008F3m-0n5U
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 03:17:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso11121565e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 20:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793243849; cv=none;
        d=google.com; s=arc-20260327;
        b=W5ob7ZYvgiaxW9ICcBsyqN/UXZ5ZWL9aDcEt7qcD5yT6MIdaNWXrcPeQuh8RFCt/av
         ifASiYiYyETk8I7XfRHs4dKnFbRJ89Fw0Ih9XQoNm+akipFjcRNJ2MEbaaCZtLBnEtLQ
         r8Q3HY+aeXwHGhkk/q/i81hjCUVZ2YuPfSE9mxp58bIoFhGo63IdMnsqYy6Sfww/oZyY
         LDH3YMYhCQcJzIYpiNhZ719pKE+WJf3QMB1hL5V5cebccIGdG3nQUDpkDiPxrEsFRPHR
         t59qaLCo/jH39IE02KhMo97vaakZ5KB/Sn1VyJazMSJn4eJn1KvHvcXjnyvXq5XHGErO
         8auA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        fh=Wnw5tRagNAi2pBu82+Ys/BZtm/IPW7LTkh02MVPFZ+Y=;
        b=nwBZR6LXN8LSVFXQ4+xCFPVewSNcHWj6CUHCpgufgYn6MIdnzAZSsiexwSRWI/C/Ag
         8bPgraORXxx3eor4TZeU7zg+4kgWaD8f2gr/pg5RpB1vyRoo27poPZn9utMRFOvS8Xqe
         YDJgQ3VLxungDDIDe+PUJ9sYnq0Ijo9+Qt3sPSRcTioip5nVejxfGsAO2Tm2IiKTwBxG
         gJ2Cx1GdKMzN+S7LWJnFU7HjR96PjRxBiG0gn+e6HmFwrLlZ/ovWdzNY36hNZN/i/2Aj
         nRl/Z/1tU7YOTX9TXOGuOnNHdREY1E8ZoeFhahwn39HQQwnJCpKjPAP5ZM6t8pK5EGmX
         22gA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793243849; x=1793848649; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=U5g2Vdh3iggerQIfYwGIZGRnVa6+SqFOPGEBWaJPaUtANtGZ/8JwZiNUXKmC+Qv5Ew
         WopGGtAiC1r1u8Bf4Mn66zvOPxKAhlsUxZ/tAuXCLCRLo3VqzVRGhufYFv1LP5AO/dBK
         NK8ZY6UdJdCVdlywaGp4QJ+kwO9AhIG3Mdgexdg1xDqFDoyWtOttAqfGIis9Zgqvc7+L
         5LLGCOOXqppsp5ftP0Nm9C9axeL6xtSzGOYGCkAsGLaAWBxrC+jMjDFuiA2FYQpX+dfY
         Jeu3XQko5RO7pFIyhhZXqnOPrvCB2xU1mgd7+TImliEZIzwzhCsy8W3wXLC4bzBydXYz
         QI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793243849; x=1793848649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2HnLVO9Ia1aLW0RavN7xDKo4uNGTSoh79eBgSOlAqg=;
        b=szGBKsUr561kLyaUPNFP+nZDsegkOJDhfdH8zrj7jL+C66fpdsDjqBgqEDLX6/j1Ns
         ywqp9j16XSQir8xH0/w/yuHw5waXgHIAcZ3+H3WQKjN2ehTe2FnzhMeHIBA2V+BFYBUa
         7Y/2aKM6j2cFYAIuOpf60yPW22KJ0VfnkK0HuBimfzA1NnxiWwKJxvU7CkYdsBCLQz39
         XIIU7hO6sek4KSwjWsZBo/nL4do6AKUB/80k/axjhgjhOYgN2/ZDCvC6jvP9faBvw87D
         kWrX7fP/UoQc7c4Tb2An8V4ah+k91Zax6afK/HaKjKaMgN6kzyRGH/RqvobByEx+eN9t
         ffbg==
X-Forwarded-Encrypted: i=1; AKwUvBzw1kQoxrCVplAx9PAuYQh4T3BuOI5OwTEcOO4SnDLew6j/0EhqbupRvt8vVVST1bELF4jycJqR/Otdnw==@lists.infradead.org
X-Gm-Message-State: AFq9FYIMuXaSjsYFsLIMoLY/6e/v9fu2a5VqrGV2fvlR6Fax7TAMUyvu
	oc/DxsEEtFuS++kA1k0ZzbPbFVj9DTZA6qzVPAvTGXGfzIODQFLKNPEzqX1zGOAJJ9J43cQstUi
	c0gG1Z4L/KbxwKZjrS7DMkH2mdiyGvSDnpPqmeOpClw==
X-Gm-Gg: AYBFou0AUil+oiOxyhiwLm7kVlPG6ROgS+t3eapzUkte4P3DrlX22XGrGuHEmUgPPoP
	ubvzXJLoMcuy1zbxRxJFJ6VAisPG03wwDRQXdcrSGty/ZYdb6cg93wYFqxsd4vpbhnqfBFPf1nC
	BIk4Vkf/2Ey9ikg4TabMssgfhl+iu11ETfmtc7kUez3B6rmWqfbpiaUvFT7TUOLgvjNvVTcYrjk
	eD9LsTIz8BbRjz9MffXPmENtOum0cWCL63zAhWwfGH1Qam2Qc0iOhcN+L4x/8ILJbZrkvOBpdoo
	NSynIcgK6QpTbxXG2QJJwzs9z4R+Rw0xPSTD22gtTalSRsZ+WRbCsSSv8G9yzhrQOktgrWmB7zt
	04gEc/AZPJCaC1JNSDhV/217WbcoY6UF/KNgmN7nUncbNeCFo+FU19faeLae66Uwpfiy+svj221
	tkn45VguxmMn+NYXHcYyKM0Nh+T4wrEdfhptJ1342Uq4jq8uCajVtfbOx02s6iy3bVoR7Z1PD3M
	IC9
X-Received: by 2002:a05:600c:354a:b0:4a2:74f:46c1 with SMTP id
 5b1f17b1804b1-4a96667c86dmr91055985e9.8.1793243848793; Wed, 28 Oct 2026
 20:17:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com> <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
In-Reply-To: <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 08:47:16 +0530
X-Gm-Features: AclHuK-lVk0iiJup6LpFGQOVP7LJYplmMO9EUMDts3fwzO894BeUhVnmdWTPpTA
Message-ID: <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_201732_261482_A9C59429 
X-CRM114-Status: GOOD (  26.68  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjksIDIwMjYgYXQgODozNuKAr0FNIFpoYW5wZW5nIFpoYW5nCjx6aGFuZ3po
YW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsIFBhdWwsIEhp
bWFuc2h1LAo+Cj4gT24gMTAvMjkvMjYgMTI6NTUgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4KPiA+
IFsuLi5dCj4gPgo+ID4gQ2hhbmdlcyBpbiB2MTEKPiA+ID09PT09PT09PT09PT09Cj4gPgo+ID4g
UmViYXNlZCBvbiBsYXRlc3QgZm9yLW5leHQgYnJhbmNoIG9mIGxpbnV4LXJpc2N2IHRyZWUgKGNv
bW1pdCBhNWFlMWJmNjVjZWUpLgo+ID4gQWxzbywgdGVzdGVkIFBNVSBkcml2ZXIgd2l0aCBib3Ro
IFBNVSBpcnFzIGFuZCBQTVUgU1NFIGV2ZW50cy4KPiA+Cj4KPiBUaGFua3MgZm9yIHJlYmFzaW5n
IGFuZCB0ZXN0aW5nIHRoZSBzZXJpZXMuIEkgd2FzIGEgbGl0dGxlIHN1cnByaXNlZAo+IHRvIHNl
ZSB2MTEgcG9zdGVkLCBhcyBJIGFtIHN0aWxsIHdvcmtpbmcgdGhyb3VnaCBIaW1hbnNodSdzIHYx
MCByZXZpZXcKPiBhbmQgdmFsaWRhdGluZyB0aGUgZml4ZXMgb24gaGFyZHdhcmUuIEl0IHdvdWxk
IGhhdmUgYmVlbiBoZWxwZnVsIHRvCj4gY29vcmRpbmF0ZSBiZWZvcmUgcmVwb3N0aW5nIHNvIHRo
YXQgdGhvc2UgY2hhbmdlcyBjb3VsZCBiZSBpbmNsdWRlZC4KPgo+IEkgZ3Vlc3MgdGhpcyBmb2xs
b3dzIFBhdWwncyByZXF1ZXN0IHRvIHJlYmFzZSBvbnRvIHJpc2N2L2Zvci1uZXh0Lgo+IEhvd2V2
ZXIsIHRoZXJlIGlzIG9uZSBjaGFuZ2UgYmV5b25kIHRoZSByZWJhc2UgdGhhdCBJIHdvdWxkIGxp
a2UgdG8KPiBjbGFyaWZ5OiB3aHkgZG9lcyBwYXRjaCA0IHJlbW92ZSB0aGUgc2NvcGVkX2d1YXJk
KHByZWVtcHQpIHNlY3Rpb25zCj4gZnJvbSB0aGUgQ1BVIGhvdHBsdWcgcGF0aHM/IFRoZXNlIHdl
cmUgcHJlc2VudCBpbiB2MTAgUkVTRU5ELCBhbmQKPiB0aGUgbG9jYWwgaGVscGVycyBzdGlsbCBy
ZXRhaW4gdGhlaXIgcHJlZW1wdGlvbi1kaXNhYmxlZCBhc3NlcnRpb25zLgo+IElzIHRoZXJlIGEg
cmVhc29uIHRoaXMgcHJvdGVjdGlvbiBpcyBubyBsb25nZXIgbmVlZGVkPwoKWWVzLCB0aGlzIGlz
IGJhc2VkIG9uIGRpc2N1c3Npb24gd2l0aCBQYXVsIHllc3RlcmRheS4KClRoaXMgc2VyaWVzIGlz
IGJsb2NraW5nIHRoZSB3aG9sZSBSQVMgQUNQSSBzdXBwb3J0LgoKPgo+IFRoZSBjaGFuZ2VzIGRp
c2N1c3NlZCBvbiB0aGUgdjEwIHRocmVhZHMgYXJlIHN0aWxsIG91dHN0YW5kaW5nIGluCj4gdGhp
cyBwb3N0aW5nOgo+Cj4gLSBQcmVzZXJ2ZSBUQVNLX1RJX0EwL0ExL0EyIGFjcm9zcyBuZXN0ZWQg
ZXhjZXB0aW9ucy4KPiAtIFJlcGxhY2UgdGhlIHRlbXBvcmFyeSBHVVAtYmFzZWQgcGVyZiB1c2Vy
LXN0YWNrIGNvcHkgd2l0aCBub2ZhdWx0Cj4gICAgdWFjY2VzcywgZm9sbG93aW5nIHRoZSB4ODYg
YXBwcm9hY2guCj4gLSBBZGRyZXNzIHRoZSBwZXItQ1BVIGluaXRpYWxpemF0aW9uL3ByZWVtcHRp
b24gY29uY2Vybi4KPiAtIFNwbGl0IHRoZSBNQUlOVEFJTkVSUyB1cGRhdGVzIGludG8gYSBzZXBh
cmF0ZSBwYXRjaC4KClRoZXJlIGlzIGFsd2F5cyBnb2luZyB0byBiZSBuZXcgdXBkYXRlcyBzaW5j
ZSBpdCB3aWxsIHRha2UKdGltZSB0byBoYXJkZW4gdGhlIFNTRSBpbXBsZW1lbnRhdGlvbi4gQWxs
IHRoZXNlIGNoYW5nZXMKY2FuIGJlIGRvbmUgYXMgc2VwYXJhdGUgZm9sbG93LW9uIHBhdGNoZXMu
Cgo+Cj4gQWRkaXRpb25hbCBmaXhlcyBmcm9tIFNhc2hpa28gcmV2aWV3LCB0aGUga2VybmVsIHRl
c3Qgcm9ib3QgcmVwb3J0LAo+IGFuZCBvdXIgZm9sbG93LXVwIGRlYnVnZ2luZyBhcmUgYWxzbyBi
ZWluZyBjb25zb2xpZGF0ZWQ6Cj4KPiAtIE5NSS1zYWZlIGVudHJ5IGFuZCBsb2NrZGVwIGlycWZs
YWdzIHRyYWNraW5nLgo+IC0gVGhlIHVudXNlZC1mdW5jdGlvbiB3YXJuaW5nIHJlcG9ydGVkIGJ5
IHRoZSBrZXJuZWwgdGVzdCByb2JvdC4KPiAtIFJWMzIgdm1hbGxvYyBzeW5jaHJvbml6YXRpb24g
YmVmb3JlIG5vZmF1bHQgZml4dXAuCj4gLSBGYXVsdGluZy1QQyB2YWxpZGF0aW9uIGluIHRoZSBr
cHJvYmUgc2luZ2xlLXN0ZXAgZmF1bHQgcGF0aC4KPiAtIFBlci1jb3VudGVyIFNUT1AgaGFuZGxp
bmcgaW4gU1NFIGVycm9yIHBhdGhzLgo+IC0gT3JkaW5hcnkgSVJRIENQVS1QTSBub3RpZmllciBv
cmRlcmluZyBhbmQgSVJRIGNsZWFudXAgdHJhY2tpbmcuCgpTYW1lIGNvbW1lbnQgYXMgYWJvdmUs
IHBsZWFzZSBkbyB0aGlzIGFzIHNlcGFyYXRlIHNlcmllcy4KTm8gcG9pbnQgaW4gaG9sZGluZyBh
bGwgb3RoZXIgZGVwZW5kZW50IHdvcmsgZW5kbGVzc2x5LgoKPgo+IEluIHBhcnRpY3VsYXIsIEhp
bWFuc2h1IGlkZW50aWZpZWQgdGhlIG1pc3NpbmcgcHJlc2VydmF0aW9uIG9mCj4gVEFTS19USV9B
MC9BMS9BMiBhY3Jvc3MgbmVzdGVkIGV4Y2VwdGlvbnMgWzFdLiBGb2xsb3dpbmcgaGlzIHJldmll
dywKPiBJIHZhbGlkYXRlZCB0aGUgZml4IHdpdGggaGFyZHdhcmUgQS9CIHRlc3Rpbmc6IHJlbW92
aW5nIGl0IHJlcHJvZHVjZWQKPiBjb3JydXB0aW9uLCB3aGlsZSB0aGUgZml4ZWQga2VybmVsIGNv
bXBsZXRlZCB0aGUgc2FtZSB0ZXN0IHNlcXVlbmNlLgo+IFRoaXMgYWxzbyBnaXZlcyB1cyBhIHNv
bGlkIGJhc2lzIGZvciByZXBsYWNpbmcgdGhlIHRlbXBvcmFyeSBHVVAKPiB3b3JrYXJvdW5kIHdp
dGggbm9mYXVsdCB1YWNjZXNzLgo+Cj4gUGF1bCwgcGxlYXNlIGhvbGQgb2ZmIG9uIHRha2luZyB0
aGlzIHZlcnNpb24gaW50byBmb3ItbmV4dCB1bnRpbAo+IHRoZXNlIGZpeGVzIGFyZSBpbmNsdWRl
ZC4gVGhlIHJlYmFzZSBhbmQgUE1VIHRlc3RpbmcgYXJlIHVzZWZ1bCwgYnV0Cj4gdGhlcmUgYXJl
IHN0aWxsIG91dHN0YW5kaW5nIGNvcnJlY3RuZXNzIGlzc3Vlcy4KPgo+IEkgd2lsbCBjb25zb2xp
ZGF0ZSB0aGUgY2hhbmdlcyBhbmQgcG9zdCB2MTIgYWdhaW5zdCByaXNjdi9mb3ItbmV4dCwKPiB3
aXRoIGFuIHVwZGF0ZWQgY2hhbmdlbG9nIGFuZCB2YWxpZGF0aW9uIHJlc3VsdHMuIExldCdzIGNv
b3JkaW5hdGUKPiB0aGUgbmV4dCBwb3N0aW5nIHRvIGtlZXAgZXZlcnl0aGluZyB0b2dldGhlci4K
Pgo+IFRoYW5rcywKPiBaaGFucGVuZwo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
YXM3OU1IdE5ZZC1WYlV1Z0BodS1oaW1jaGF1LWJsci5xdWFsY29tbS5jb20vCgpSZWdhcmRzLApB
bnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
