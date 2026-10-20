Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A4B606A31B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=joyBy9BU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E7cOqdYq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PMy9blx7C6fzSlo5djj8wuHNAa1MmIHUOBp8/JE+KM=; b=joyBy9BU5TgRMk
	j2XVEKCIlEpGwllwvbN9TR4P9UkrWnjyHSIbteGEdVU9yWuhm3JjK8PZ1bVSpLru/tMKZP1+sOSqV
	DB/EP76vgZedp/wjMgPqPXHaBv8E4fWHZW+BSLHMLNQmr8gXrtsyeITTB/NMjasu4tRx506Vpn1bY
	u6srO2wk3ROAGvgQHa29EiwgoyGVEKq/g1QiL/lC0Nn7YdGWjow93eERWMWFQRlE8Mytnm562aame
	3zjJo7ehk4aRagyKNqffDyuunH80vehbFViwGpoLIVuCAbfRk9cB/dj/rKwQWt6h/rb/2x+H0h3RG
	GOVz/M1HrQ8nlNMpmS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ag-00000009hI7-3Nt4;
	Tue, 20 Oct 2026 12:42:26 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ae-00000009hHn-2Hpc
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 12:42:25 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8565d77c277so23159877b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 05:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500143; cv=none;
        d=google.com; s=arc-20260327;
        b=Elov2JRrpO7zUyMRzm+N6GA6g5ZKy1wVhYEBZ1Gd/Fx7wsAApEo+xdjEnfBs1W1gf2
         Gf0IWHvVl9t/bAIHCnTC2CbDJVognpTJWDOlckvgRcPQ0ceqIWpg+TD7hxpDAkmMhgML
         jMd+A81XJowlztrt0MuBLn4MY2ij4u2toKw9zTBBAFARd031eovkBGCnK5KJUhARKkYM
         76J/TxyoWF4BK97BWismkNS1o7vovv39d3Z+/aw6fqhyXWZlYOBR9eYnuJHqDzURdNyq
         CdCmggpUjZ2U1QzawlFRQsH/duXDQkckqUIyhATIDFV6x6MCgd5wycW7ydGAnpDmVhdk
         eurQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e2sTq8rdN+VW7WxDK+7MxrZLHRc/4eEUgMwJJ4qrXBE=;
        fh=Ro2UNcyJydMEK8BAVClDHnzyuN/m1PAygvRfArurFyI=;
        b=WKNrYInlN4AMDU39lyuxYAxuWKZY1NT5rCwEN/8RMMlg2vQ9K1pTGz1Vavre4pr40k
         jmP3vLtnphD65MSq6joVal4ln/sAKtS9HIgtxa4Pd2eBYQy6FdzDuc5jX2/0Jdtwv6hq
         JAS+PLnIPrHNoE0XB4Q7gig09AS9YVztGRG0iSMdlqdwHIt2TgL06CIwngJIkK/W8zA8
         jWzJMtQRgYBjxOErg06CR8eRlP46iat2J1dsqyFBSguyOHVLDcQ57WVyE5h0MW2G+ZLV
         me/dE5QY5mQ4wESsMAVC/YWYdkznmBIVqXQPkJBPyg28gJpGkPBaTNdZK5Ai3M/A/Bqm
         56/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500143; x=1793104943; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e2sTq8rdN+VW7WxDK+7MxrZLHRc/4eEUgMwJJ4qrXBE=;
        b=E7cOqdYq3tPhfd1qVpR5lxuokjM07zeTSdef3nYVsp5Jlz1ZUZc9KFOTQYiisFhcex
         Ao1jlZ+HMncAGMXMvklK092mtvqLpFEEQtlIMvh2HibXu57GbrCAS1/y1ayKtzB85yHA
         y9KTxTV+Uyq6uc9MoS2YytqFr9O195WkB8U6ajYNSSxCUV684jCQJHwwzG6yR3O/Icx7
         fFB6xR4XS6xCHpUqxO1r3N/pnUedEwpm3yMMlv3Q+RlolIK3fcLT/tNZQptJLaciCPAJ
         QH4JLeyWcENTF43Hm5Z54ND7gNeCraQodAfiqJYX5Ric+54MxmqgIkY7oHGmmjVwiXud
         PM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500143; x=1793104943;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2sTq8rdN+VW7WxDK+7MxrZLHRc/4eEUgMwJJ4qrXBE=;
        b=MgKI+P57qL7EBiNIY7bFKyBUAd8tkmcEe6vjIgxMWpZ93EEWvRlvd3ATkWfgiqggME
         bdOX8DXqMqNEmi8vkQPCndJIwOqqGWXJJwX2sntWugjvmWK2PIt+UK80wXyJmf2rmpU/
         0+CzHj8yONnnuujmfjmm+RD2nJ4ukfyp2WA8zP3IfaVVEzc5e9p34MRCh+PsNtDigUGN
         Ox5JPh2ruPKUkOSH+lJ5YSYUetEqHmV86LzhgH9VPYIJ6K1zEV+nYeQ9xJtxogpwN12t
         HjtXgmNYFUzk0HG9dyHhVPnOJLOgK0zlRSM6PpSxO64mHc4uvdLTnyYxTV2uK6DRjwIC
         G+Ug==
X-Forwarded-Encrypted: i=1; AKwUvBxr2OXSzWD+TiUe1l6l+SUPXsFrwRevDrV/qpjuq3izB2F4y5GxEGoNDSfZu6Tr3at2yFJH7LirgFUkng==@lists.infradead.org
X-Gm-Message-State: AFq9FYKNhWIBh8Ok4P+rcXpo7ftZxzGmfT0AVGidMAlFvbLDuWaby4vh
	RO+1UlxDdLlLcNcGjJ7tnNZ0Fr7ANASdsBO4G0oAiihtMs7aawDynZsdIjXiJY63hR1wit3tuUT
	2OTm5QYBgbHk2sKzLUIPTgkTvqHW5ggY=
X-Gm-Gg: AYBFou0rzppqRprUythM2drKRpHJLw8doU4koWkSQSb+B6w3MBi81Rjp0+CcbtuDwLB
	wbAAQWH5Ra4R31XbRWM20/qQAM8GXZsAgZ/0+MExzG+g/L3bZoWqmm5MJA7uxoNHLnDVBF6WVB9
	MNA8Pla6lOGqs1cBAWRGb7o+5fqGu9eusYHJAhZphexaK0WTW4SuBY84EhocMciP20LGhbHgVKP
	SPQ/DXyAfi2O5XnwWUNv75JZTR1gmrAJM+c1Kg16UtLPJkcNEJ9qFCaCiJPE89CoVitgRvs/Y8W
	Ugzx+BSWuPxtiAZ92hkhsQ/B9kv5/kwXzDg/wMmGc0d6QcMgoo6mKqt6nILOtNFpdg==
X-Received: by 2002:a05:690c:a686:b0:871:bc3:9856 with SMTP id
 00721157ae682-8b0f21ae1a6mr25138067b3.33.1792500143092; Tue, 20 Oct 2026
 05:42:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-tlb_tracepoint-v6-1-14476427870f@gmail.com>
 <20261019100029.32a09f71@gandalf.local.home> <CALsPMBOKENath9-6pUoPrrSRbuudg0V9tc76bLcxsnkQJJkvgQ@mail.gmail.com>
 <20261019142644.5f02d139@gandalf.local.home>
In-Reply-To: <20261019142644.5f02d139@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Tue, 20 Oct 2026 14:42:11 +0200
X-Gm-Features: AclHuK8dqEhVh2tz4HUjh8KpGEYzpZopHeRe1CVlc-2n0yq-l7w7CGlJ9Twyn-s
Message-ID: <CALsPMBNVuwwmf51186gu8K-KeQQtSBBVjbg+z57xuMa+nr=DEA@mail.gmail.com>
Subject: Re: [PATCH v6] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_054224_589728_92842E71 
X-CRM114-Status: GOOD (  14.89  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBPY3QgMTksIDIwMjYgYXQgODoyNuKAr1BNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgMTkgT2N0IDIwMjYgMTk6MjQ6MTcgKzAy
MDAKPiBSb21hbiBTdG9yb3poZW5rbyA8cm9tZXVzbWVpc3RlckBnbWFpbC5jb20+IHdyb3RlOgo+
Cj4gPiBJJ3ZlIHJlbmFtZWQgdGhlIGhlYWRlciB0byBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Rs
Yl90cmFjZS5oCj4gPiBpbiB2Ny4gSSBwcmVmZXIgdGhpcyBvdmVyIHJpc2N2X3RyYWNlLmggYmVj
YXVzZSB0aGUgbGF0dGVyCj4gPiBzb3VuZHMgdG9vIGdlbmVyaWMgZm9yIGEgaGVhZGVyIGRlZGlj
YXRlZCB0byBUTEIgdHJhY2luZy4KPiA+Cj4gPiBEaWQgeW91IGhhdmUgYSBicm9hZGVyIHVzZSBp
biBtaW5kLCBzdWNoIGFzIGluY2x1ZGluZyBvdGhlcgo+ID4gUklTQy1WIHRyYWNlcG9pbnRzIGlu
IHRoaXMgaGVhZGVyPwo+ID4KPiA+IElmIHlvdSBzdGlsbCBwcmVmZXIgcmlzY3ZfdHJhY2UuaCwg
SSdtIGhhcHB5IHRvIHJlY29uc2lkZXIuCj4KPiBFaXRoZXIgcmlzY3ZfdHJhY2UuaCBvciB0bGJf
dHJhY2UuaCBpbiB0aGUgcmlzY3YgZGlyZWN0b3J5IGlzIGZpbmUgd2l0aCBtZS4KPiBJdCdzIG1v
cmUgb2YgYSBkZWNpc2lvbiBmb3IgdGhlIFJJU0NWIG1haW50YWluZXJzLiBJZiB5b3UgcGxhbiBv
biBoYXZpbmcKPiBtb3JlIFJJU0NWIHNwZWNpZmljIHRyYWNlIGV2ZW50cywgZG8geW91IHdhbnQg
dGhlbSBhbGwgaW4gb25lIGhlYWRlciwgb3IKPiB3aWxsIGVhY2ggaGF2ZSB0aGVpciBvd24gInRy
YWNlXyouaCIgaGVhZGVyPwo+Cj4gSSdtIGZpbmUgZWl0aGVyIHdheSwgYXMgbG9uZyBhcyB0aGV5
IGFyZSBuYW1lZCB3aXRoICJ0cmFjZSIgaW4gdGhlbSBpbgo+IG9yZGVyIHRvIGFja25vd2xlZGdl
IHRoYXQgdGhleSBkZWZpbmUgdHJhY2UgZXZlbnRzLgo+Cj4gLS0gU3RldmUKClRoYW5rcyBmb3Ig
dGhlIGNsYXJpZmljYXRpb24sIFN0ZXZlLgoKSSdsbCBrZWVwIHRsYl90cmFjZS5oIGZvciBUTEIt
c3BlY2lmaWMgZXZlbnRzLiBJZiBJIGludHJvZHVjZQp0cmFjZXBvaW50cyBmb3Igb3RoZXIgUklT
Qy1WIHN1YnN5c3RlbXMgaW4gdGhlIGZ1dHVyZSwgSSdkCnByZWZlciBzZXBhcmF0ZSBoZWFkZXJz
IGZvbGxvd2luZyB0aGUgPHN1YnN5c3RlbV9uYW1lPl90cmFjZS5oCm5hbWluZyBjb252ZW50aW9u
LgoKLS0gCktpbmQgcmVnYXJkcywKUm9tYW4gJ0hlZGluJyBTdG9yb3poZW5rbwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
