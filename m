Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D464606A31A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 03:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q5kp66S5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Q0cgGNSc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	In-Reply-To:References:Mime-Version:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=0elc0l6anXmdgoEn1gIewMnaxMNDua5oUmtwKs+AQ10=; b=q5kp66S5afNfevlJnGxJSOgJ1c
	q0LD+Ia7fhu/PGxDMZgIq9zxGtbttiKZNj0R2mawe7PEcO8MmciqA260KGM4UMQGxr9Kt+rtfuoEG
	Vf7OVxPoS7hMDgyguG1/swzB9XNAfSOTt9Wi9VJoH8QiH1xZEMYaHja3Y6W0DAA5dxO4hhkDpgweC
	cFIsIoXcmw1+sZn/hjKL0z6BdhNOQya1rjdz9EMSiqr9dMhnJ2Ju7CsJZUDDl72LMYfJHRt2HhU80
	ec/On/yOAmdKLq1BSvx/5Ae0E0CaFraKh3pbM8QyDlRqPkXD35orLyMYkIrqYkAUo+RL2uIxJVBLy
	Z/lBYelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMH0P-00000008FsO-11z8;
	Thu, 29 Oct 2026 03:40:45 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMH0I-00000008Fqs-12gD
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 03:40:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so289514e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 20:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793245236; cv=none;
        d=google.com; s=arc-20260327;
        b=DwtujvPePE4nG+Y0X9wBJXZRkjOG4pED05gcUR5MJ5PmhZL4+693N/ZxL6FcOzhujg
         wJcsV6DvEQkdvuf4ktMifky7k72+6Aapm65+6qtlOQB6r1V6w3xxYN+YJ+n9zX2+bEpX
         aBHBDow6fWsQC+X0Pj0VnIKAjwuUXQtKGrEwQN1fwh4kKI2SnrW5bFzWw3SkE50Jf1KL
         33gk+7lK/HAi9o4oAIPyFsXJuc2CLF5PXM6r/zHCkGIU+bI0qbwObRzgWrqV4lIhlxtp
         wKH861PSWRERIa8y8omuHUNLDGy5liG6sbrI56/uiubWHCUptPKR3byVIUyM4LZemrKv
         qCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:user-agent:from:dkim-signature;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        fh=5FX8jzeoVE+K0+rSaOxG4GGBMp0YA44cqhu8HdmZ8rQ=;
        b=GUdspvMDI7J2qd5GU6X5OlO4jMnrj7tIswj1/u1gXjRxPcTOwf7cxXtETSzbBQdmnS
         XSbiSN/Bh1yvpoMBypL0GdYuRmglfKoR+yxinJclZde2NXiNUVXH/1wkjyxcwtpisRqJ
         /cYXdUXj4KrooRInxqxAXuiALAECu/Yjlh6p7VcDEnEYnlKMtOd/YeHA0vYEUuhKkiup
         Idq9bkOf5/6FsFPgpUhy/Z+G6iWaM6Vr0qhVFpC/edTi8Cy+yJASKE/XkKNItBgDISAw
         YFp+w+66PDq7VXX/rdLEcvor4psYTSFIo2oIjt53SOV7CvEbmo2Uhu76p0KsykME4pzI
         bzWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793245236; x=1793850036; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:user-agent:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        b=Q0cgGNScd780+13ILZsU5RG9tZ2VpbIborz/uIDR2qtAqmzcJwSWuY9HZ+JSrltuJZ
         36GsaqdPCMIm7N/+9/K1FMkF1JuqKHqkj014zxEzV+ir5PyJDdv+KuHtjn7ZsvdbKun2
         hIuudMRbbKCnI1+GabZmGCrB3Khsnx6TV/xfm/PE3yWoFcL0PVuNHAxkWBYqycPafDpQ
         y7WHsFYlBFVK8L4Hv7Rl/7Om/IB8CqXzcbU13npNWxaANKc+m4gv+Lvp6AallDUEOTq9
         DuaJb7y16aSeNhfEMtUVHPhATSpB5gsSr1ggZU/XQMX7jF6Hi9s3NmhXwBJUnRnFrYEM
         F5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245236; x=1793850036;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:in-reply-to:references:mime-version:user-agent:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9kpCROtj4+oMCA1t2d29m32pyjhCLnRU2codU4EShc=;
        b=nOVFn6PJ93p7JB8nrbAzA9sDT85Q2USepqXyZEIMBMDX8HR6Wv+doSrbAbDOVgleW5
         sjJADu39LGoV1wswLPgNXAxnu/ySKx9msPdcaTsHDe7M96BdzRJPoqV9kcjR1LS0/1ze
         XQyLDqPgpnoHe4x6eJk7Tred73A5l6EluE+JPEiu04HT9FyC0pBCxthipEHqllQK1nNl
         DfIl7eqlTevJGQRmaB4/eIfqbX5AqYJaojMXmlh7iP9nDFjfnhpFVkhKaWbiTPd0GM0f
         P7QtlEObYglwCWbtjV1MvABNZJqiiNrIEHz4w7ClCQTV5AnmNyy3Z7gJ5nTwse97CQLs
         +ClA==
X-Forwarded-Encrypted: i=1; AKwUvByb9gBpFmpY/qNRdfoTPWLCXlKV6XBALqgpKWobDnB129kIO9aitvLIpgj/zTON0e2JdBuxKfwD8vo1eg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJBoko+yCFKd0fHeUVs97DA0ZN2+eS5At1c1QAuZMloit/NLwFI
	rEpA1GqtpKc50isj0e1rDS00ZKt94oR5/hk071jI35BO10c3aPT5fzf+9UIh7tV8yLYni7ssaRe
	yOqe9Ha/0WEUGoa6RaTxrk8PraP6ZE+Gw+vXr9i2hNA==
X-Gm-Gg: AYBFou2PcHmGZjOHXq7BVDdEZgSBl18iAJ+JMxxSqVDGspRoqNXRoa6CKY1p5is/hWK
	AnnjBs5ACg1wGtqAdhwc/1fRnuIZQ2H4fLW9noqiD+NpNXIMnFHPZCstfKlY4jNuURTBxZuTXdM
	Xa4ROTNPQeJxltNRviWzRgRAEVqAaJ1qlGCWkOAdNMG5DIO0Lztlb3H7A9BezTdfUODkVw52Bls
	prqyRY0PHw8pwg0Mn1tNNMwh65mC16xp1UcU6jz3XWZsHHGy4Y7MX+5V7gikv5o/9yF4QyyojE5
	uxDXwU+uxMufpb1Das70t7kYMvupAVRLEMJddAFZznH8qEDEWxgitwoJaGPMLfLyB3Gg15c2Qso
	RZdymaGhFAkHXYlSghKS/wz++D1ER2JZTsJkxLg==
X-Received: by 2002:a05:6512:10cd:b0:5bf:b6f6:e81a with SMTP id
 2adb3069b0e04-5bfd11b6e58mr399145e87.19.1793245235608; Wed, 28 Oct 2026
 20:40:35 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 20:40:34 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 20:40:34 -0700
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com> <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
In-Reply-To: <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com>
Date: Wed, 28 Oct 2026 20:40:34 -0700
X-Gm-Features: AclHuK8WQ6e-ALzK5a1gaSR322umexfJNu7ra0n_GcOfKrsqQ5w5YBowqgksE4o
Message-ID: <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
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
X-CRM114-CacheID: sfid-20261028_204038_340591_A88ADE59 
X-CRM114-Status: GOOD (  26.06  )
X-Spam-Score: 0.2 (/)
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
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgYWxsLAoKT24gMTAvMjkvMjYgMTE6MTcgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gT24gVGh1
LCBPY3QgMjksIDIwMjYgYXQgODozNuKAr0FNIFpoYW5wZW5nIFpoYW5nCj4gPHpoYW5nemhhbnBl
bmcuamFzcGVyQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBBbnVwLCBQYXVsLCBIaW1h
bnNodSwKPj4KPj4gT24gMTAvMjkvMjYgMTI6NTUgQU0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4+Cj4+
PiBbLi4uXQo+Pj4KPj4+IENoYW5nZXMgaW4gdjExCj4+PiA9PT09PT09PT09PT09PQo+Pj4KPj4+
IFJlYmFzZWQgb24gbGF0ZXN0IGZvci1uZXh0IGJyYW5jaCBvZiBsaW51eC1yaXNjdiB0cmVlIChj
b21taXQgYTVhZTFiZjY1Y2VlKS4KPj4+IEFsc28sIHRlc3RlZCBQTVUgZHJpdmVyIHdpdGggYm90
aCBQTVUgaXJxcyBhbmQgUE1VIFNTRSBldmVudHMuCj4+Pgo+Pgo+PiBUaGFua3MgZm9yIHJlYmFz
aW5nIGFuZCB0ZXN0aW5nIHRoZSBzZXJpZXMuIEkgd2FzIGEgbGl0dGxlIHN1cnByaXNlZAo+PiB0
byBzZWUgdjExIHBvc3RlZCwgYXMgSSBhbSBzdGlsbCB3b3JraW5nIHRocm91Z2ggSGltYW5zaHUn
cyB2MTAgcmV2aWV3Cj4+IGFuZCB2YWxpZGF0aW5nIHRoZSBmaXhlcyBvbiBoYXJkd2FyZS4gSXQg
d291bGQgaGF2ZSBiZWVuIGhlbHBmdWwgdG8KPj4gY29vcmRpbmF0ZSBiZWZvcmUgcmVwb3N0aW5n
IHNvIHRoYXQgdGhvc2UgY2hhbmdlcyBjb3VsZCBiZSBpbmNsdWRlZC4KPj4KPj4gSSBndWVzcyB0
aGlzIGZvbGxvd3MgUGF1bCdzIHJlcXVlc3QgdG8gcmViYXNlIG9udG8gcmlzY3YvZm9yLW5leHQu
Cj4+IEhvd2V2ZXIsIHRoZXJlIGlzIG9uZSBjaGFuZ2UgYmV5b25kIHRoZSByZWJhc2UgdGhhdCBJ
IHdvdWxkIGxpa2UgdG8KPj4gY2xhcmlmeTogd2h5IGRvZXMgcGF0Y2ggNCByZW1vdmUgdGhlIHNj
b3BlZF9ndWFyZChwcmVlbXB0KSBzZWN0aW9ucwo+PiBmcm9tIHRoZSBDUFUgaG90cGx1ZyBwYXRo
cz8gVGhlc2Ugd2VyZSBwcmVzZW50IGluIHYxMCBSRVNFTkQsIGFuZAo+PiB0aGUgbG9jYWwgaGVs
cGVycyBzdGlsbCByZXRhaW4gdGhlaXIgcHJlZW1wdGlvbi1kaXNhYmxlZCBhc3NlcnRpb25zLgo+
PiBJcyB0aGVyZSBhIHJlYXNvbiB0aGlzIHByb3RlY3Rpb24gaXMgbm8gbG9uZ2VyIG5lZWRlZD8K
Pgo+IFllcywgdGhpcyBpcyBiYXNlZCBvbiBkaXNjdXNzaW9uIHdpdGggUGF1bCB5ZXN0ZXJkYXku
Cj4KPiBUaGlzIHNlcmllcyBpcyBibG9ja2luZyB0aGUgd2hvbGUgUkFTIEFDUEkgc3VwcG9ydC4K
Pgo+Pgo+PiBUaGUgY2hhbmdlcyBkaXNjdXNzZWQgb24gdGhlIHYxMCB0aHJlYWRzIGFyZSBzdGls
bCBvdXRzdGFuZGluZyBpbgo+PiB0aGlzIHBvc3Rpbmc6Cj4+Cj4+IC0gUHJlc2VydmUgVEFTS19U
SV9BMC9BMS9BMiBhY3Jvc3MgbmVzdGVkIGV4Y2VwdGlvbnMuCj4+IC0gUmVwbGFjZSB0aGUgdGVt
cG9yYXJ5IEdVUC1iYXNlZCBwZXJmIHVzZXItc3RhY2sgY29weSB3aXRoIG5vZmF1bHQKPj4gICAg
IHVhY2Nlc3MsIGZvbGxvd2luZyB0aGUgeDg2IGFwcHJvYWNoLgo+PiAtIEFkZHJlc3MgdGhlIHBl
ci1DUFUgaW5pdGlhbGl6YXRpb24vcHJlZW1wdGlvbiBjb25jZXJuLgo+PiAtIFNwbGl0IHRoZSBN
QUlOVEFJTkVSUyB1cGRhdGVzIGludG8gYSBzZXBhcmF0ZSBwYXRjaC4KPgo+IFRoZXJlIGlzIGFs
d2F5cyBnb2luZyB0byBiZSBuZXcgdXBkYXRlcyBzaW5jZSBpdCB3aWxsIHRha2UKPiB0aW1lIHRv
IGhhcmRlbiB0aGUgU1NFIGltcGxlbWVudGF0aW9uLiBBbGwgdGhlc2UgY2hhbmdlcwo+IGNhbiBi
ZSBkb25lIGFzIHNlcGFyYXRlIGZvbGxvdy1vbiBwYXRjaGVzLgo+Cj4+Cj4+IEFkZGl0aW9uYWwg
Zml4ZXMgZnJvbSBTYXNoaWtvIHJldmlldywgdGhlIGtlcm5lbCB0ZXN0IHJvYm90IHJlcG9ydCwK
Pj4gYW5kIG91ciBmb2xsb3ctdXAgZGVidWdnaW5nIGFyZSBhbHNvIGJlaW5nIGNvbnNvbGlkYXRl
ZDoKPj4KPj4gLSBOTUktc2FmZSBlbnRyeSBhbmQgbG9ja2RlcCBpcnFmbGFncyB0cmFja2luZy4K
Pj4gLSBUaGUgdW51c2VkLWZ1bmN0aW9uIHdhcm5pbmcgcmVwb3J0ZWQgYnkgdGhlIGtlcm5lbCB0
ZXN0IHJvYm90Lgo+PiAtIFJWMzIgdm1hbGxvYyBzeW5jaHJvbml6YXRpb24gYmVmb3JlIG5vZmF1
bHQgZml4dXAuCj4+IC0gRmF1bHRpbmctUEMgdmFsaWRhdGlvbiBpbiB0aGUga3Byb2JlIHNpbmds
ZS1zdGVwIGZhdWx0IHBhdGguCj4+IC0gUGVyLWNvdW50ZXIgU1RPUCBoYW5kbGluZyBpbiBTU0Ug
ZXJyb3IgcGF0aHMuCj4+IC0gT3JkaW5hcnkgSVJRIENQVS1QTSBub3RpZmllciBvcmRlcmluZyBh
bmQgSVJRIGNsZWFudXAgdHJhY2tpbmcuCj4KPiBTYW1lIGNvbW1lbnQgYXMgYWJvdmUsIHBsZWFz
ZSBkbyB0aGlzIGFzIHNlcGFyYXRlIHNlcmllcy4KPiBObyBwb2ludCBpbiBob2xkaW5nIGFsbCBv
dGhlciBkZXBlbmRlbnQgd29yayBlbmRsZXNzbHkuCj4KCkkgYWdyZWUgdGhhdCB3ZSBzaG91bGQg
dW5ibG9jayB0aGUgZGVwZW5kZW50IHdvcmsuIEhvd2V2ZXIsIEkgd291bGQKbm90IGNoYXJhY3Rl
cml6ZSBhZGRyZXNzaW5nIGEga25vd24sIHJlcHJvZHVjZWQgaXNzdWUgYXMgaG9sZGluZyB0aGlu
Z3MKdXAgZW5kbGVzc2x5LgoKPj4KPj4gSW4gcGFydGljdWxhciwgSGltYW5zaHUgaWRlbnRpZmll
ZCB0aGUgbWlzc2luZyBwcmVzZXJ2YXRpb24gb2YKPj4gVEFTS19USV9BMC9BMS9BMiBhY3Jvc3Mg
bmVzdGVkIGV4Y2VwdGlvbnMgWzFdLiBGb2xsb3dpbmcgaGlzIHJldmlldywKPj4gSSB2YWxpZGF0
ZWQgdGhlIGZpeCB3aXRoIGhhcmR3YXJlIEEvQiB0ZXN0aW5nOiByZW1vdmluZyBpdCByZXByb2R1
Y2VkCj4+IGNvcnJ1cHRpb24sIHdoaWxlIHRoZSBmaXhlZCBrZXJuZWwgY29tcGxldGVkIHRoZSBz
YW1lIHRlc3Qgc2VxdWVuY2UuCj4+IFRoaXMgYWxzbyBnaXZlcyB1cyBhIHNvbGlkIGJhc2lzIGZv
ciByZXBsYWNpbmcgdGhlIHRlbXBvcmFyeSBHVVAKPj4gd29ya2Fyb3VuZCB3aXRoIG5vZmF1bHQg
dWFjY2Vzcy4KPj4KPj4gUGF1bCwgcGxlYXNlIGhvbGQgb2ZmIG9uIHRha2luZyB0aGlzIHZlcnNp
b24gaW50byBmb3ItbmV4dCB1bnRpbAo+PiB0aGVzZSBmaXhlcyBhcmUgaW5jbHVkZWQuIFRoZSBy
ZWJhc2UgYW5kIFBNVSB0ZXN0aW5nIGFyZSB1c2VmdWwsIGJ1dAo+PiB0aGVyZSBhcmUgc3RpbGwg
b3V0c3RhbmRpbmcgY29ycmVjdG5lc3MgaXNzdWVzLgo+Pgo+PiBJIHdpbGwgY29uc29saWRhdGUg
dGhlIGNoYW5nZXMgYW5kIHBvc3QgdjEyIGFnYWluc3QgcmlzY3YvZm9yLW5leHQsCj4+IHdpdGgg
YW4gdXBkYXRlZCBjaGFuZ2Vsb2cgYW5kIHZhbGlkYXRpb24gcmVzdWx0cy4gTGV0J3MgY29vcmRp
bmF0ZQo+PiB0aGUgbmV4dCBwb3N0aW5nIHRvIGtlZXAgZXZlcnl0aGluZyB0b2dldGhlci4KPj4K
Pj4gVGhhbmtzLAo+PiBaaGFucGVuZwo+Pgo+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci9hczc5TUh0TllkLVZiVXVnQGh1LWhpbWNoYXUtYmxyLnF1YWxjb21tLmNvbS8KPgo+IFJlZ2Fy
ZHMsCj4gQW51cAoKSSdsbCBwb3N0IGEgZm9jdXNlZCB2MTIgYmVmb3JlIHRoaXMgd2Vla2VuZCB3
aXRoIHRoZSBpbW1lZGlhdGUKY29ycmVjdG5lc3MgZml4ZXMuIEZ1cnRoZXIgaW1wcm92ZW1lbnRz
IGNhbiBmb2xsb3cgc2VwYXJhdGVseS4KClRoYW5rcywKWmhhbnBlbmcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
