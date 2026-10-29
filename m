Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832A3606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 06:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rsVzOOpS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=cB8ATc2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nN9r7lxmRqZmbIIUxQ9aLdY55wMyEM3J3qAbDtqzCUI=; b=rsVzOOpS7gEi1BjXAZdfpatmj2
	tLVhcADdmZ+P90AiJMz7aQJn4fy3YzzhR0iqJLbYuU0bfTTZ6tuQD6PQpKOaRq+oDIldsShWqknMP
	+Jby5rLra4+NvQEWCurDwJhzQ9mfpU0OE+I6HbT5DzVAx3D0SBjBG++34auqj6sM5G3EvukbwbPZz
	1UgD7lYssCYgJWldWTgz6zglQkAt2V6Y9+i1cSmaL9Vi6yHgwV/qT/+0dCuXdb/PNhGvsPtiN7hU8
	a+qZX7xGlgSnkIQ1fDkD6HHLIxwGRqUwrOgoTglS4QXtQKBS4Is9b+24cEIwFMT3pDTSJY+ykZxy+
	A+kDBTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJDy-00000008QdB-3ihN;
	Thu, 29 Oct 2026 06:02:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJDw-00000008Qcm-0PSM
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 06:02:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1419760f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 23:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793253770; cv=none;
        d=google.com; s=arc-20260327;
        b=fk/2/knFH9SK91CePSc+suNr7mXoLHZhJwGjL/BhoNcdrK6bZYQh/JaUGMfdnHIEiC
         mONLOZn99EmhfcZ8ELimOR+xyTdmScWOxhLCp7LUBFuV/W9yDtsFNF3y+irRT3wv71/Q
         hvSKU2os4EN8CMImvcFtkB6aFnlnxC/JN9JbTIEFvv1obqSfLclZ3WRH1k583Itpgx1Y
         UDXq83frB40lla91+MfzJLFd42QCxkdYroYBlmlY/NriJTNDaZ+VsOld0/xH4h4zQErr
         S9TJcqapFQHtBM7+nrId4jkM3dLL78mzO0wdEhoAt7btgeHIEIWXXWMXAJvStPux4jPk
         ie4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        fh=L5332jFJbRvTejDpTwjY1FuOyQz1GUChfwLk2w/s4Ss=;
        b=BUnRjhNVykb5QWn5fMe79khOaYSRIx/kez80lrB5FUprl4j67k2PgGmhrMkfdSqaMR
         sD85MoapiwVr1W4B8dVdRSHtp+7mi8y2qmiFPBDp3CImS7jtJZkOf5SCTQ5MVnFLKBhi
         SolRanaCNPGwzIGKthAAehuRTVCAZB6/pMkLk7SnOYexNPpMIpLtTinrchJcjrRBR97/
         0KizA1Q9P3nsGy/Dy6S+nVJMjqSsUspD5xxTwX6iUf2V/ZpEVQMSpdIxquuarcKe6dpw
         zefVxsFVwA+MaYHxDt4bW2BBwEyFuI1bRymW6Onc/TSG96sKKiFSVi08dtWQN/aBc5qs
         BxeA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793253770; x=1793858570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=cB8ATc2SSFzevmtty+tNfLV2OWI8qgwbQkjbi8OZtI5Z1ObgN/kQ/UBBNKotUNC/Bu
         x1ge9ht9fkdpo5YuopbHQo0TXsBLs7AHzXqSbVjOtt9/+jrTzooRN71u34Tw01gIoxMu
         hFF+mm9wAkelKT3pSpLZRxXlqIZ9G1fEUbfudC/BpbpN4Y8bZ5jFcNYhSyIVj2kjHL2D
         PooUJ3H9AHEeUsToa/Es/r/qEXDvD5ViRpJ2g7YTcfZrPFPpFpDo0UgbY7eCxvBkXrjn
         akNkRZLso8TZAC50yrklQEpW69Im2tAdl2iQw3PMDswiLTh7z3h6mHYHke72G0DBJVEv
         D4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253770; x=1793858570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=AUeA8PDWYn3RXKxi4nyNLzn1zzNUrCKwrIiPSNLdZFsWHIhqXWK0Th5dWfvhxG9M+K
         dv9sh2sDoCGPF7zX8jtg8HL5BPjCLv43//WqzVAx+ouMuR3LujTQlKQtqEaXVIeeZgWY
         xPek+bo3xPHWVV7ULEDe/Fv9PELxSL3IbAXLGmRCr3O3Jr5BBYsz7Fx7bdLBbNZ7Xoxj
         gWAcGgIvQ2Ykk1JnFk8QU+Q5D4CyPN+h6aJtVaBicz2La1W8eAmGEd0sSuSjrKn32kq7
         bru1BqT4BLoBUdm29FL9MfRgVtM2Ub1EYcaj6XTgp+ej1E7a25T5P3QELXehhbA+YRtv
         0zqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2y5zjoyF2/SRJI759CuwwW4GciVsAufp6yNzLLRQuLoDrbI9Xm3/zv0bYqvPayjLjBosqr1wm9+n5lw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKkwnGwngIyTClTPOmCTKNZm0Y3BbJnrvckR372Fz8Y0TH+G1jc
	FCzQni6eC1kQ1jw7cRpeTYNBOE3Km6xuD6V2W7AOERR6Cx644rbknn93B1+C1/sPjJqKa4Fki3o
	w+H0c3Vzx+PeZNI+/jEnixEQaVaKjO0K746i+p4PDRg==
X-Gm-Gg: AYBFou3vc6rFfGuI2IhpEjeyC6cWp7VOD98oq8m/HMK/jajaqmSDIzipoG3wzFRB+v7
	NgSsSZRMlvvGMOT8CTryGhbTtOTbvURVXmqLJpNKPHzmMiT6MYoIXWsgpHGEg8ZmmiuLp14O2g9
	En0q/cvkXBhpsZhP6PRyYLpD5uiKYC4jL4+OwiVs6isPa4rbaVsBfy+x58flwzJs7cr7mixpg8C
	SnqUJbzKZlxWbH2xAaLUlGpJ6gUquytF73fd896KSk7FsOOOqf1MKpHboEYlkKKltUxVMNq3soV
	PYJz9W0KynMWN+7U9xkGBUeItSaq1U/zrsXml3S3QEgEyhjQofWqPpOuKBZBJjCIv0o8/26bwoR
	8YMwwmbtWEo66yln4y8PU9+JnQfiRmpc3Rjbv9LGzWdUPP/tbww2tR0YkEhk06bq1ibb1akQ6Wc
	pRCEE7zwfxYVQXqGUVj53FKn0tfJl5dMkXWH/XgJOuPfXzFDLCU8nAkLKd
X-Received: by 2002:a05:6000:41c5:b0:48d:f3f8:f910 with SMTP id
 ffacd0b85a97d-48e5d5a45c0mr10372553f8f.34.1793253769206; Wed, 28 Oct 2026
 23:02:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com> <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
In-Reply-To: <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:32:36 +0530
X-Gm-Features: AclHuK_p0hCRo8pr_WRUDjy07skD9Um-9_bl0z2ojXK9jzlo0dDOGwVfM7SiBGw
Message-ID: <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
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
X-CRM114-CacheID: sfid-20261028_230252_176558_AEFD5236 
X-CRM114-Status: GOOD (  35.34  )
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

T24gVGh1LCBPY3QgMjksIDIwMjYgYXQgOToxMOKAr0FNIFpoYW5wZW5nIFpoYW5nCjx6aGFuZ3po
YW5wZW5nLmphc3BlckBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIGFsbCwKPgo+IE9uIDEw
LzI5LzI2IDExOjE3IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gVGh1LCBPY3QgMjksIDIw
MjYgYXQgODozNuKAr0FNIFpoYW5wZW5nIFpoYW5nCj4gPiA8emhhbmd6aGFucGVuZy5qYXNwZXJA
Ynl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBBbnVwLCBQYXVsLCBIaW1hbnNodSwK
PiA+Pgo+ID4+IE9uIDEwLzI5LzI2IDEyOjU1IEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4+Cj4g
Pj4+IFsuLi5dCj4gPj4+Cj4gPj4+IENoYW5nZXMgaW4gdjExCj4gPj4+ID09PT09PT09PT09PT09
Cj4gPj4+Cj4gPj4+IFJlYmFzZWQgb24gbGF0ZXN0IGZvci1uZXh0IGJyYW5jaCBvZiBsaW51eC1y
aXNjdiB0cmVlIChjb21taXQgYTVhZTFiZjY1Y2VlKS4KPiA+Pj4gQWxzbywgdGVzdGVkIFBNVSBk
cml2ZXIgd2l0aCBib3RoIFBNVSBpcnFzIGFuZCBQTVUgU1NFIGV2ZW50cy4KPiA+Pj4KPiA+Pgo+
ID4+IFRoYW5rcyBmb3IgcmViYXNpbmcgYW5kIHRlc3RpbmcgdGhlIHNlcmllcy4gSSB3YXMgYSBs
aXR0bGUgc3VycHJpc2VkCj4gPj4gdG8gc2VlIHYxMSBwb3N0ZWQsIGFzIEkgYW0gc3RpbGwgd29y
a2luZyB0aHJvdWdoIEhpbWFuc2h1J3MgdjEwIHJldmlldwo+ID4+IGFuZCB2YWxpZGF0aW5nIHRo
ZSBmaXhlcyBvbiBoYXJkd2FyZS4gSXQgd291bGQgaGF2ZSBiZWVuIGhlbHBmdWwgdG8KPiA+PiBj
b29yZGluYXRlIGJlZm9yZSByZXBvc3Rpbmcgc28gdGhhdCB0aG9zZSBjaGFuZ2VzIGNvdWxkIGJl
IGluY2x1ZGVkLgo+ID4+Cj4gPj4gSSBndWVzcyB0aGlzIGZvbGxvd3MgUGF1bCdzIHJlcXVlc3Qg
dG8gcmViYXNlIG9udG8gcmlzY3YvZm9yLW5leHQuCj4gPj4gSG93ZXZlciwgdGhlcmUgaXMgb25l
IGNoYW5nZSBiZXlvbmQgdGhlIHJlYmFzZSB0aGF0IEkgd291bGQgbGlrZSB0bwo+ID4+IGNsYXJp
Znk6IHdoeSBkb2VzIHBhdGNoIDQgcmVtb3ZlIHRoZSBzY29wZWRfZ3VhcmQocHJlZW1wdCkgc2Vj
dGlvbnMKPiA+PiBmcm9tIHRoZSBDUFUgaG90cGx1ZyBwYXRocz8gVGhlc2Ugd2VyZSBwcmVzZW50
IGluIHYxMCBSRVNFTkQsIGFuZAo+ID4+IHRoZSBsb2NhbCBoZWxwZXJzIHN0aWxsIHJldGFpbiB0
aGVpciBwcmVlbXB0aW9uLWRpc2FibGVkIGFzc2VydGlvbnMuCj4gPj4gSXMgdGhlcmUgYSByZWFz
b24gdGhpcyBwcm90ZWN0aW9uIGlzIG5vIGxvbmdlciBuZWVkZWQ/Cj4gPgo+ID4gWWVzLCB0aGlz
IGlzIGJhc2VkIG9uIGRpc2N1c3Npb24gd2l0aCBQYXVsIHllc3RlcmRheS4KPiA+Cj4gPiBUaGlz
IHNlcmllcyBpcyBibG9ja2luZyB0aGUgd2hvbGUgUkFTIEFDUEkgc3VwcG9ydC4KPiA+Cj4gPj4K
PiA+PiBUaGUgY2hhbmdlcyBkaXNjdXNzZWQgb24gdGhlIHYxMCB0aHJlYWRzIGFyZSBzdGlsbCBv
dXRzdGFuZGluZyBpbgo+ID4+IHRoaXMgcG9zdGluZzoKPiA+Pgo+ID4+IC0gUHJlc2VydmUgVEFT
S19USV9BMC9BMS9BMiBhY3Jvc3MgbmVzdGVkIGV4Y2VwdGlvbnMuCj4gPj4gLSBSZXBsYWNlIHRo
ZSB0ZW1wb3JhcnkgR1VQLWJhc2VkIHBlcmYgdXNlci1zdGFjayBjb3B5IHdpdGggbm9mYXVsdAo+
ID4+ICAgICB1YWNjZXNzLCBmb2xsb3dpbmcgdGhlIHg4NiBhcHByb2FjaC4KPiA+PiAtIEFkZHJl
c3MgdGhlIHBlci1DUFUgaW5pdGlhbGl6YXRpb24vcHJlZW1wdGlvbiBjb25jZXJuLgo+ID4+IC0g
U3BsaXQgdGhlIE1BSU5UQUlORVJTIHVwZGF0ZXMgaW50byBhIHNlcGFyYXRlIHBhdGNoLgo+ID4K
PiA+IFRoZXJlIGlzIGFsd2F5cyBnb2luZyB0byBiZSBuZXcgdXBkYXRlcyBzaW5jZSBpdCB3aWxs
IHRha2UKPiA+IHRpbWUgdG8gaGFyZGVuIHRoZSBTU0UgaW1wbGVtZW50YXRpb24uIEFsbCB0aGVz
ZSBjaGFuZ2VzCj4gPiBjYW4gYmUgZG9uZSBhcyBzZXBhcmF0ZSBmb2xsb3ctb24gcGF0Y2hlcy4K
PiA+Cj4gPj4KPiA+PiBBZGRpdGlvbmFsIGZpeGVzIGZyb20gU2FzaGlrbyByZXZpZXcsIHRoZSBr
ZXJuZWwgdGVzdCByb2JvdCByZXBvcnQsCj4gPj4gYW5kIG91ciBmb2xsb3ctdXAgZGVidWdnaW5n
IGFyZSBhbHNvIGJlaW5nIGNvbnNvbGlkYXRlZDoKPiA+Pgo+ID4+IC0gTk1JLXNhZmUgZW50cnkg
YW5kIGxvY2tkZXAgaXJxZmxhZ3MgdHJhY2tpbmcuCj4gPj4gLSBUaGUgdW51c2VkLWZ1bmN0aW9u
IHdhcm5pbmcgcmVwb3J0ZWQgYnkgdGhlIGtlcm5lbCB0ZXN0IHJvYm90Lgo+ID4+IC0gUlYzMiB2
bWFsbG9jIHN5bmNocm9uaXphdGlvbiBiZWZvcmUgbm9mYXVsdCBmaXh1cC4KPiA+PiAtIEZhdWx0
aW5nLVBDIHZhbGlkYXRpb24gaW4gdGhlIGtwcm9iZSBzaW5nbGUtc3RlcCBmYXVsdCBwYXRoLgo+
ID4+IC0gUGVyLWNvdW50ZXIgU1RPUCBoYW5kbGluZyBpbiBTU0UgZXJyb3IgcGF0aHMuCj4gPj4g
LSBPcmRpbmFyeSBJUlEgQ1BVLVBNIG5vdGlmaWVyIG9yZGVyaW5nIGFuZCBJUlEgY2xlYW51cCB0
cmFja2luZy4KPiA+Cj4gPiBTYW1lIGNvbW1lbnQgYXMgYWJvdmUsIHBsZWFzZSBkbyB0aGlzIGFz
IHNlcGFyYXRlIHNlcmllcy4KPiA+IE5vIHBvaW50IGluIGhvbGRpbmcgYWxsIG90aGVyIGRlcGVu
ZGVudCB3b3JrIGVuZGxlc3NseS4KPiA+Cj4KPiBJIGFncmVlIHRoYXQgd2Ugc2hvdWxkIHVuYmxv
Y2sgdGhlIGRlcGVuZGVudCB3b3JrLiBIb3dldmVyLCBJIHdvdWxkCj4gbm90IGNoYXJhY3Rlcml6
ZSBhZGRyZXNzaW5nIGEga25vd24sIHJlcHJvZHVjZWQgaXNzdWUgYXMgaG9sZGluZyB0aGluZ3MK
PiB1cCBlbmRsZXNzbHkuCj4KPiA+Pgo+ID4+IEluIHBhcnRpY3VsYXIsIEhpbWFuc2h1IGlkZW50
aWZpZWQgdGhlIG1pc3NpbmcgcHJlc2VydmF0aW9uIG9mCj4gPj4gVEFTS19USV9BMC9BMS9BMiBh
Y3Jvc3MgbmVzdGVkIGV4Y2VwdGlvbnMgWzFdLiBGb2xsb3dpbmcgaGlzIHJldmlldywKPiA+PiBJ
IHZhbGlkYXRlZCB0aGUgZml4IHdpdGggaGFyZHdhcmUgQS9CIHRlc3Rpbmc6IHJlbW92aW5nIGl0
IHJlcHJvZHVjZWQKPiA+PiBjb3JydXB0aW9uLCB3aGlsZSB0aGUgZml4ZWQga2VybmVsIGNvbXBs
ZXRlZCB0aGUgc2FtZSB0ZXN0IHNlcXVlbmNlLgo+ID4+IFRoaXMgYWxzbyBnaXZlcyB1cyBhIHNv
bGlkIGJhc2lzIGZvciByZXBsYWNpbmcgdGhlIHRlbXBvcmFyeSBHVVAKPiA+PiB3b3JrYXJvdW5k
IHdpdGggbm9mYXVsdCB1YWNjZXNzLgo+ID4+Cj4gPj4gUGF1bCwgcGxlYXNlIGhvbGQgb2ZmIG9u
IHRha2luZyB0aGlzIHZlcnNpb24gaW50byBmb3ItbmV4dCB1bnRpbAo+ID4+IHRoZXNlIGZpeGVz
IGFyZSBpbmNsdWRlZC4gVGhlIHJlYmFzZSBhbmQgUE1VIHRlc3RpbmcgYXJlIHVzZWZ1bCwgYnV0
Cj4gPj4gdGhlcmUgYXJlIHN0aWxsIG91dHN0YW5kaW5nIGNvcnJlY3RuZXNzIGlzc3Vlcy4KPiA+
Pgo+ID4+IEkgd2lsbCBjb25zb2xpZGF0ZSB0aGUgY2hhbmdlcyBhbmQgcG9zdCB2MTIgYWdhaW5z
dCByaXNjdi9mb3ItbmV4dCwKPiA+PiB3aXRoIGFuIHVwZGF0ZWQgY2hhbmdlbG9nIGFuZCB2YWxp
ZGF0aW9uIHJlc3VsdHMuIExldCdzIGNvb3JkaW5hdGUKPiA+PiB0aGUgbmV4dCBwb3N0aW5nIHRv
IGtlZXAgZXZlcnl0aGluZyB0b2dldGhlci4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+PiBaaGFucGVu
Zwo+ID4+Cj4gPj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvYXM3OU1IdE5ZZC1WYlV1
Z0BodS1oaW1jaGF1LWJsci5xdWFsY29tbS5jb20vCj4gPgo+ID4gUmVnYXJkcywKPiA+IEFudXAK
Pgo+IEknbGwgcG9zdCBhIGZvY3VzZWQgdjEyIGJlZm9yZSB0aGlzIHdlZWtlbmQgd2l0aCB0aGUg
aW1tZWRpYXRlCj4gY29ycmVjdG5lc3MgZml4ZXMuIEZ1cnRoZXIgaW1wcm92ZW1lbnRzIGNhbiBm
b2xsb3cgc2VwYXJhdGVseS4KCkxpbnV4LTcuNCBtZXJnZSB3aW5kb3cgY2xvc2VzIGVuZC1vZiB0
aGlzIHdlZWsgc28geW91ciB2MTIKd2lsbCBiZSB0b28gbGF0ZSBmb3IgaXQgaGVuY2UgSSBzdWdn
ZXN0IHNlbmRpbmcgaW5jcmVtZW50YWwgZml4ZXMKc2VwYXJhdGVseS4KClJlZ2FyZHMsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
