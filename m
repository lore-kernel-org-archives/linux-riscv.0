Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1201C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:05:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4202660240
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4202660240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kj/kuswTXxYxAYz4mP7sqt+qwjfl+7NHeR5WSNvfgWc=; b=YVyEO/IOZL6SKIa7eSmWYyaR4
	2JrXWahthI+Iy+HnbaHeOtlRDr7AIl6glSnEkHKSSGZyFnPgdnZz4aUd4RMOdBEvdO75uEdZ/4qen
	RSyQ3IEVq9qHM00ate6/pBBQh8lAoxBuYoMrtEdqkfGuIiz4v1PouLZtfbcYI3CZ14lc3kH0nl/Ok
	KNBhV+Q5QgdYBcBM6TadFro6Y2CK8Qaf2C2pj9o/BWGGwzilwIHC+us2YCaDAHUUexVf50t76zWeB
	7le8b9iON0pSyeHinQq9Ea3Id94N21vQn6mTKV9IKDoL2po096aG7/s6Wn1A0cHslP0zrcHrNqbBn
	2Gx6UnBqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvKB-000qTw-9g; Mon, 29 Mar 2021 17:05:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQouD-000ZVL-45
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 10:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=u9+uPN3ZuuHGDJfO7yHJWEJZT06F6DUWNxrPo9GXHxo=; b=gKqSirVdTY1rgzejjN1SrLWsu2
 z/hjea/z9QIikqvcAPCShFkC5za37CR5ANn5uLhc5JmDLJJgR5SmUuDziZ81PdYVoSdGBp+D71/VV
 YxRE4TjgBK9QrbnvELEfvY00l/QGUniRTxIP/vYGw3B41NzcEyOPRR8vZhMNNpthoUyAToZFQj0G1
 3L5xjzgr862pIM6X9oqrQzp54oh0GtlifyBEk3wKyi4zT6g86qhKZj1LXpLrvMARu6KK6HRBmyyFu
 1R34VzCI6p50jdg28tZWVw6P07rctspJETLMV6aGW0U6Wq1huOeRoBCcdDYQLdT1m2FhPHFY4+Y6m
 cg+afwsA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQTj8-0001Tv-S0
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 11:37:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C13661976
 for <linux-riscv@lists.infradead.org>; Sun, 28 Mar 2021 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616931420;
 bh=8r+E9jML76H0gCn8zByIpf9ts7froA6i3yzLNHuBvN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DugdbpT4GDM1HZeaem5soSAi/FHElDFHhmz2xIpsZJUkasWv28ZB3zgK93tR/c1EG
 Wg6UZIL/32OGSKHjIL7I3TejYIFIJatZ2S0hfZTZhMaw3y2P3h3z4TJdRouH33c2P4
 a0vFE4t1YxIuiIc5HdVc8iBz2z/pz1daXtvTbooBxBTN2T1IZ64j2pxee2ABx/u+UN
 R9Tpd5W1OnKdE7r9gQzXgqssvnkZagFrOM0DWS5GTeRlV6XS25xWzL3c0iO1XPbWAb
 sCLOKxIHwnhTcR+YQphOeEdtMjQrjqZYOIz3pgbUdAYY8+PAy495HKeu1P90Dt67iE
 cgL/CGET6Tr6g==
Received: by mail-lf1-f49.google.com with SMTP id b4so14221346lfi.6
 for <linux-riscv@lists.infradead.org>; Sun, 28 Mar 2021 04:37:00 -0700 (PDT)
X-Gm-Message-State: AOAM532SxNzte1H64RtrXmEUCPCkL+ThCPQHK9MoPiS//82TtDFr/Aun
 sbypwNZXcFg4ZaYdgJnawD6RQ8VIc/jrUwP9X+Q=
X-Google-Smtp-Source: ABdhPJyj9o7D6hGhD+tmVxlzoBXg46BNhDKM+Nvrw+oWgxcsNgQKl214mB8IGaefEjDYpDQx2VSVsVg9V+sA7ebVJIA=
X-Received: by 2002:a19:f501:: with SMTP id j1mr14083138lfb.231.1616931418962; 
 Sun, 28 Mar 2021 04:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
 <1616913028-83376-5-git-send-email-guoren@kernel.org>
 <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
In-Reply-To: <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 28 Mar 2021 19:36:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvPOZ6aWxof66gzOBfia5mAV0=3pxO+QPdW8xpQrz3aA@mail.gmail.com>
Message-ID: <CAJF2gTQvPOZ6aWxof66gzOBfia5mAV0=3pxO+QPdW8xpQrz3aA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] powerpc/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-xtensa@linux-xtensa.org, 
 Guo Ren <guoren@linux.alibaba.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 openrisc@lists.librecores.org, Paul Mackerras <paulus@samba.org>, 
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_123707_963628_09FA0E63 
X-CRM114-Status: GOOD (  18.03  )
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

T24gU3VuLCBNYXIgMjgsIDIwMjEgYXQgNzoxNCBQTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+IHdyb3RlOgo+Cj4KPgo+IExlIDI4LzAzLzIwMjEgw6AgMDg6
MzAsIGd1b3JlbkBrZXJuZWwub3JnIGEgw6ljcml0IDoKPiA+IEZyb206IEd1byBSZW4gPGd1b3Jl
bkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBXZSBkb24ndCBoYXZlIG5hdGl2ZSBodyB4Y2hn
MTYgaW5zdHJ1Y3Rpb24sIHNvIGxldCBxc3BpbmxvY2sKPiA+IGdlbmVyaWMgY29kZSB0byBkZWFs
IHdpdGggaXQuCj4KPiBXZSBoYXZlIGxoYXJ4L3N0aGN4IHBhaXIgb24gc29tZSB2ZXJzaW9ucyBv
ZiBwb3dlcnBjLgo+Cj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9s
aW51eHBwYy1kZXYvcGF0Y2gvMjAyMDExMDcwMzIzMjguMjQ1NDU4Mi0xLW5waWdnaW5AZ21haWwu
Y29tLwpHb3QgaXQsIHRoeCBmb3IgdGhlIGluZm9ybWF0aW9uLgoKPgo+IENocmlzdG9waGUKPgo+
ID4KPiA+IFVzaW5nIHRoZSBmdWxsLXdvcmQgYXRvbWljIHhjaGcgaW5zdHJ1Y3Rpb25zIGltcGxl
bWVudCB4Y2hnMTYgaGFzCj4gPiB0aGUgc2VtYW50aWMgcmlzayBmb3IgYXRvbWljIG9wZXJhdGlv
bnMuCj4gPgo+ID4gVGhpcyBwYXRjaCBjYW5jZWxzIHRoZSBkZXBlbmRlbmN5IG9mIG9uIHFzcGlu
bG9jayBnZW5lcmljIGNvZGUgb24KPiA+IGFyY2hpdGVjdHVyZSdzIHhjaGcxNi4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBDYzog
TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pgo+ID4gQ2M6IEJlbmphbWluIEhl
cnJlbnNjaG1pZHQgPGJlbmhAa2VybmVsLmNyYXNoaW5nLm9yZz4KPiA+IENjOiBQYXVsIE1hY2tl
cnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPiA+IC0tLQo+ID4gICBhcmNoL3Bvd2VycGMvS2NvbmZp
ZyB8IDEgKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+ID4g
aW5kZXggMzg2YWUxMmQ4NTIzLi42OWVjNGFkZTY1MjEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Bv
d2VycGMvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcKPiA+IEBAIC0xNTEs
NiArMTUxLDcgQEAgY29uZmlnIFBQQwo+ID4gICAgICAgc2VsZWN0IEFSQ0hfVVNFX0NNUFhDSEdf
TE9DS1JFRiAgICAgICAgIGlmIFBQQzY0Cj4gPiAgICAgICBzZWxlY3QgQVJDSF9VU0VfUVVFVUVE
X1JXTE9DS1MgICAgICAgICAgaWYgUFBDX1FVRVVFRF9TUElOTE9DS1MKPiA+ICAgICAgIHNlbGVj
dCBBUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTICAgICAgICBpZiBQUENfUVVFVUVEX1NQSU5MT0NL
Uwo+ID4gKyAgICAgc2VsZWN0IEFSQ0hfVVNFX1FVRVVFRF9TUElOTE9DS1NfWENIRzMyIGlmIFBQ
Q19RVUVVRURfU1BJTkxPQ0tTCj4gPiAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0lQQ19QQVJTRV9W
RVJTSU9OCj4gPiAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0lSUVNfT0ZGX0FDVElWQVRFX01NCj4g
PiAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0xEX09SUEhBTl9XQVJOCj4gPgoKCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3NreS8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
