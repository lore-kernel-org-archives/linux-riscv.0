Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA98F55432
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 06:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nHCl/wnERlLXr5PhHNEVhJVfak5tuBuIeUstx45byWU=; b=YtU+4Cl4mUd0v4
	GJOwfRM73hwRyF+remz+PLlhcQRRRpbS8bXzirkO++pIiGXGDX/yfMOh8iVcsW9ck+B9AwSeY3+L8
	OF/HabDD1bWCO/tXTGkdfK75fXgC4icJern5oqQOX4kSTJP6WCjpPpztNumuDf8aaM6WTwKDMvL2w
	HCsudZRrTBONUjXljtXjysu0ucp3zyUDvnyZpW2r/3suCzWWP6BH1oRbu59Xc7ngSodKoby8rH2eT
	wUGbiLYVwa1PCHx/YEyAKEJzQjchPw4QJ4lp4TUX9DuK/TKHQ2/zls8dh+pb+BlgfOo7hPvrr91e6
	iJuNrmBzFb3OuOWXhoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUQ6-00000005Snl-0iPh;
	Thu, 26 Feb 2026 06:00:18 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUQ2-00000005Smh-1jeW
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 06:00:16 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-662f9aeb782so424910eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 22:00:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772085613; cv=none;
        d=google.com; s=arc-20240605;
        b=gtoLW2gCndpPXWVI9RZIsLjJo1V58xwI2lQeH0nkU4aZSdtbHDzOmmwXZmWQa2OLSF
         fTYi3kyXGHo1ehwFQMP+EkDIZlqJFC0r1fiZw3/Ag4akwgJb9Rc3pFqgBw+1GxpK2K81
         ziqc77WjD1ZK5uaOjUaAg4sADkAUxZmiJP+DpvFL//TkilhOm2UR01IzYhlu9loVh64Z
         ukhs84Zf7qtK39PcR6ISEx2zsXAzzcT4mRcIu89eLfREkQryswteQgG360EyRKL9BRhq
         gRS1J9mlXtWwrRgRTn9jjhlcVo8bTZAMU4kulQg/QA2S1I8gsjcN9x94ISVhP8MOT6XW
         +acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaBkiCbKFk+jtOcOhydSv18/ATIpNF+APtbum9WdzSk=;
        fh=B0nz+XAhd9zmXMLuIrNWc6fNvs1M9di7mdzkOs/RJO8=;
        b=ObN1Bf0RvBXF7QHH7sgQQhewUQnr3q0cmblQdQ3/xCJLBKCWWF1FIR1VkhNsGXiOcW
         NqgJyt9KVp3Z5HZ5aXeuHWVVT7OWbfvb9JdmCrZrtoj8yCCI5lfN8UOrb1XwIoXRlyRo
         r2bRZGnjrvIMBQSTAXhZmVhqKkPEEXIJaLh6amS15PdzDgam78VbP7D4ml29+Hx1aI9t
         NWVTB4yVGvxyuvmb7gyIWkRcpDu2PHgvQEf5uF15Y4c94hyENtch8iEWVTygHv21YZ4N
         gw8X8LVts/gTkdhpAaZJ8mF2/ljKLddBST0yksgqLCyhPQlLYTdQzkdnTTSdmspkebCY
         Z6/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772085613; x=1772690413; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaBkiCbKFk+jtOcOhydSv18/ATIpNF+APtbum9WdzSk=;
        b=KIEZilES100la2hVeWgC/0pYF/i34K0eKfCkniaRn0PiDWoVhM2hD5mjSc/D41tFVs
         PiOLPPZ+dy8rr+h6mUTwi3loXaB8Oq3mJf8L25QClPyMogpiUrES84jkNJb2fUfpOlMS
         vE0mP12iORcW4O4GJyh6NJIStArsl2moWEgaGCvLnydOaaGCpRFgKZu6qPrw38LTP8nk
         VJAeiM5HNteJFadlj2oVyvGirGdH2wwS/JNHTpBZkfEpdjBirSB9SQA99ggqVLAqHZiM
         cTcJVRw9ifq6dQD9jCBDhvRfQxAzGterO9FPhUmJuQRDe2S8Jvt2aJbwEdbf0q3oER5S
         atVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772085613; x=1772690413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaBkiCbKFk+jtOcOhydSv18/ATIpNF+APtbum9WdzSk=;
        b=FI/PzpvAyIFyxiQhtpToLryBUJUyvUk/UmTvmh2kGTalZfK8l/ITjbQhzuzHvqPpfW
         LcSWDG6M9X3fdQYLrqgt1FWOG821x1Et/qsZzz7WnIE91f3tgLv1lEMXmvrnNRt3YYky
         Bq/Xeks2q0RKJfWJl7EasoeC5iYVA28xJtVkCErL/H56euYhNhobkGQBHIpsIIK8NVIz
         ojUuW6wWDHs2X/xeJ8Gd2658iF0vcLACwwCajiQ2pz+hy7D4DiHvre7sA3sHDw3Q9cKT
         fXabtkCE0iRiQqgUSdjuac+HBfAOv91pMsyyLJe2USj1tkAWKbRTrkorJ4jJBtnTnljg
         a2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7kiBgiMlhbneGuR2Dc+/TbI47/KyJDropRKc3xwfkLdeGnX36/JKRSkcfs8jUTWFYechtuzSeZLdYiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/43DYQ9q1drd7+cweWNYY7z73ikfZPAjqXA2uVNXDBLPozJ18
	PV5SY8X3/hzajb6ZS3bbLsmydI8MGZsnB5H5SSJ1oPbMmMKojXjkp3TQa+z4ACfSfatd6oLR/8E
	tILM4KUlSQUQhftnRPYJZFzAYZ/tYUQg6Y2erZgyBzw==
X-Gm-Gg: ATEYQzzwQ1grS+fK9P5cqMT2jkj1FpC5dW9OiDxv2MpweP9IoCgfsdJhqGanPjp7xWl
	esgC4O0JPwT6au5/1PAjaERaacT2c/H0hs1QuPyoP4giBV8J4SpVVOXIWF70Ttz4LMbxISZMBii
	k7P2Qj5l1YQga51B7ek3qSByEqhL+svL12HnYvpNg/uYHjzd4TtUjGtRmFx5wK4RlX3kDeyFlUG
	6WRRXm57QhPqr84SiyHY6w34cUuEuTnEuF01O3OKShEBKa3wIVKFQyd7heCRSNRUpkk4hCDAVCw
	PIviqXqzYOcvLZ+RVHJRpclBre8gCRIucgm6TSKslrYmELw0jy/02sWgF7GkKyNajnikMOeUU/E
	Pc19GPCOQCnmWcmxMfuJY8JCXvnU=
X-Received: by 2002:a05:6820:4611:b0:679:9646:69c1 with SMTP id
 006d021491bc7-679c47190e0mr7255747eaf.74.1772085612488; Wed, 25 Feb 2026
 22:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20260130101557.1314385-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260130101557.1314385-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Feb 2026 11:30:00 +0530
X-Gm-Features: AaiRm512q56kQGlC9Rn6Aq0NKfEpD-2Lh4341PKjku_mYqRwWUtpAEUYZ2k0hbU
Message-ID: <CAAhSdy2e4UYBRfU_m6RX-pWBBEv+Wu2Sqngg05FEG195odwhNw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_vcpu_aia_rmw_topei()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atish.patra@linux.dev>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_220014_826247_A05D7BFB 
X-CRM114-Status: GOOD (  19.22  )
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

T24gRnJpLCBKYW4gMzAsIDIwMjYgYXQgMzo0NuKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdfdG9wZWkoKSBh
c3N1bWVzIHRoYXQgdGhlIHBlci12Q1BVIElNU0lDIHN0YXRlIGhhcwo+IGJlZW4gaW5pdGlhbGl6
ZWQgb25jZSBBSUEgaXMgcmVwb3J0ZWQgYXMgYXZhaWxhYmxlIGFuZCBpbml0aWFsaXplZCBhdAo+
IHRoZSBWTSBsZXZlbC4gVGhpcyBhc3N1bXB0aW9uIGRvZXMgbm90IGFsd2F5cyBob2xkLgo+Cj4g
VW5kZXIgZnV6emVkIGlvY3RsIHNlcXVlbmNlcywgYSBndWVzdCBtYXkgYWNjZXNzIHRoZSBJTVNJ
QyBUT1BFSSBDU1IKPiBiZWZvcmUgdGhlIHZDUFUgSU1TSUMgc3RhdGUgaXMgc2V0IHVwLiBJbiB0
aGlzIGNhc2UsCj4gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0ZSBpcyBzdGlsbCBO
VUxMLCBhbmQgdGhlIFRPUEVJIFJNVyBwYXRoCj4gZGVyZWZlcmVuY2VzIGl0IHVuY29uZGl0aW9u
YWxseSwgbGVhZGluZyB0byBhIGhvc3Qga2VybmVsIGNyYXNoLgo+Cj4gVGhlIGNyYXNoIG1hbmlm
ZXN0cyBhczoKPiAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZp
cnR1YWwgYWRkcmVzcwo+ICAgZGZmZmZmZmYwMDAwMDAwZQo+ICAgLi4uCj4gICBrdm1fcmlzY3Zf
dmNwdV9haWFfaW1zaWNfcm13IGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jOjkwOQo+ICAga3Zt
X3Jpc2N2X3ZjcHVfYWlhX3Jtd190b3BlaSBhcmNoL3Jpc2N2L2t2bS9haWEuYzoyMzEKPiAgIGNz
cl9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjIwOAo+ICAgc3lzdGVtX29wY29kZV9p
bnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjI4MQo+ICAga3ZtX3Jpc2N2X3ZjcHVfdmly
dHVhbF9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjM1NQo+ICAga3ZtX3Jpc2N2X3Zj
cHVfZXhpdCBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYzoyMzAKPiAgIGt2bV9hcmNoX3ZjcHVf
aW9jdGxfcnVuIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYzoxMDA4Cj4gICAuLi4KPgo+IEZpeCB0aGlz
IGJ5IGV4cGxpY2l0bHkgY2hlY2tpbmcgd2hldGhlciB0aGUgdkNQVSBJTVNJQyBzdGF0ZSBoYXMg
YmVlbgo+IGluaXRpYWxpemVkIGJlZm9yZSBoYW5kbGluZyBUT1BFSSBDU1IgYWNjZXNzZXMuIElm
IG5vdCwgZm9yd2FyZCB0aGUgQ1NSCj4gZW11bGF0aW9uIHRvIHVzZXIgc3BhY2UuCj4KPiBGaXhl
czogMmY0ZDU4Zjc2MzVhZSAoIlJJU0MtVjogS1ZNOiBWaXJ0dWFsaXplIHBlci1IQVJUIEFJQSBD
U1JzIikKPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPHh1amlha2FpMjAyNUBpc2Nhcy5hYy5j
bj4KPiBTaWduZWQtb2ZmLWJ5OiBKaWFrYWkgWHUgPGppYWthaVBlYW51dEBnbWFpbC5jb20+Cj4g
LS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWEuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL2FpYS5jCj4gaW5kZXggZGFkMzE4MTg1NjYwMC4uYzE3NmI5NjBkOGE0MCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYS5jCj4gQEAgLTIyOCw2ICsyMjgsMTAgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdf
dG9wZWkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgaWYgKCFrdm1fcmlzY3ZfYWlh
X2luaXRpYWxpemVkKHZjcHUtPmt2bSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBLVk1fSU5T
Tl9FWElUX1RPX1VTRVJfU1BBQ0U7Cj4KPiArICAgICAgIC8qIElmIElNU0lDIHZDUFUgc3RhdGUg
bm90IGluaXRpYWxpemVkIHRoZW4gZm9yd2FyZCB0byB1c2VyIHNwYWNlICovCj4gKyAgICAgICBp
ZiAoIXZjcHUtPmFyY2guYWlhX2NvbnRleHQuaW1zaWNfc3RhdGUpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiBLVk1fSU5TTl9FWElUX1RPX1VTRVJfU1BBQ0U7Cj4gKwoKVGhpcyBzaG91bGQgYmUg
cGFydCBvZiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfcm13KCkuCgpBbHNvLCBGaXhlcyB0YWcg
c2hvdWxkIHBvaW50IHRvOgpkYjhiN2U5N2Q2MTM3ICgiUklTQy1WOiBLVk06IEFkZCBpbi1rZXJu
ZWwgdmlydHVhbGl6YXRpb24gb2YgQUlBIElNU0lDIikKCj4gICAgICAgICByZXR1cm4ga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3Jtdyh2Y3B1LCBLVk1fUklTQ1ZfQUlBX0lNU0lDX1RPUEVJLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFsLCBuZXdfdmFs
LCB3cl9tYXNrKTsKPiAgfQo+IC0tCj4gMi4zNC4xCj4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
