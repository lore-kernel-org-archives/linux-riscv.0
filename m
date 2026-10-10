Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0609CA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zDTq7fFGoZBSn+lP++QtvFy4NvUyWBCT7EcL0n+mLjo=; b=2P6aKN+TUVaqRZ
	uQ2UJUkEjqbjriIog0iVF9TPx4fblDxCwnu3fZ7/B+7CSYtoplxl3AC2VOOyNhJVp2cByaqU/2kGE
	fXHCFvwdV1bLXMp3JFIb1oRkfFPn6Bk7cC0j71hT/9XPAH2/mdRfCajHPOFzGdv/5EpKblVLZAT/A
	pph20x6beapXtcZtb8ycoEin3k0kvgrBUB7EDcKLpzSkLtr3vSV7Q8TsK2Dd06t1vSk7ptHmSWMTr
	iFj3g1tsVaPetcQ6dq1R48svxDGOo1tbg33cBvOBZYY4GNYfV45mbwPCSQKOZXeHAWsUIW+5O9Gt6
	5nm4eEfUAONjlaY0l2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnp-00000007i92-2jAz;
	Sat, 10 Oct 2026 08:51:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFSnm-00000007i79-2XOV
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 08:51:35 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso409203f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 01:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791622293; cv=none;
        d=google.com; s=arc-20260327;
        b=VaxF1FhMn5d9mDcWpJr2zRtzgVGXFPdN0jG97MzEQ5BAftgyhKBmUbrqVre0t7jzaL
         gVLl5d2P604EdpJe40TfRrsGxITYBEW1ihohVSYMW+7Rgle0ncrwfT+h9duY7FfPCZbE
         /cpJfxd0wG3QAcgTtmJhJhIBf3QJZ4Z8J7KLbPsg4axCRd+DGw7udXY0rw/MtdJ5Zho6
         kqKtZoyNWApcavr43Zc87ob6CHWiebQ0u6/UahTaXCns+P7GdPPHgxiyEswr6s9lZ+8/
         uPk3Loie7mXHg+0i1FTvNBucmtok/EQEMEVLJKaMw0ZNvbYWw3FQhz/3ityG0bFi4u57
         z5DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C6tCpuU1dy+mG56KK8qDndK4H2Po4jPbRKZ0gvmsaI0=;
        fh=le7R3BJpaKb3IIOKiKkKgCe8QlupytfT5Rv57zKCXXI=;
        b=pp2SVx1iYRqvtS8Izfm7cj8fMv1xjPKyBH5WLodGSyVw79MDq1dNY3poiY/78X1W9D
         4npjJV+2U6DPWURTQeYEDp9ImtbvzZaetCSmN+xzd68mt2222PTOpF4xqIgXfsm94Ij0
         ABfqzQgXdWpx1VHoSgRIYEFU++Tf4B55fUTXHeSweB+VTfhvN3JN8MMf1rLrKD7mtqdy
         eOYfPauP0f5Q6TyioAvtbu4u4I6cI2yuj4me0xCk0g+BwFftCwPzPwIez6F1Qf0evJY2
         mnwtCO2mXNUrb7eU41AqgIo8AaAF7hGbKPUDsiZnjG5nCUYEiBhamUcFzmqkrD05N6HD
         mHog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791622293; x=1792227093; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6tCpuU1dy+mG56KK8qDndK4H2Po4jPbRKZ0gvmsaI0=;
        b=jgGrXyib0K2AD7aoQasnXpnA/tf2n0WqZQMcXiLTFJgIP1N+12nDOIPvQkfm1XGjJ/
         ARUDLq9KjF8P4qqq51Dka8OszLOFH7qY4EyM2XAWHpwMs62v+IG0SNNE1+l1FYcdq4uD
         drJxOUsWz8Btm93+qshX9CdaBPWIJTl4dVKZyEZ6jHF8xWaI2MhpC3jrYmQqjPxj3w4O
         gflcw5X4haV6a4cD5V01gfq8S7vsZ7pUOhlIh7ctl57/aCxJa6ngMMZ79fRHuOrtv8jx
         St2v7Lvj2K4Vo1NItr4Ao3jgLb9ApzyX0sbSdCH/bybGCxqRJtfKJCC0R/cBxSxokzNZ
         LODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791622293; x=1792227093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6tCpuU1dy+mG56KK8qDndK4H2Po4jPbRKZ0gvmsaI0=;
        b=nF42kvS2SED+VQAjsoOfbM4AgIUSEmDX5LNNBoM1DJvELjlFCdfCMlIZ1M0mL0B8kZ
         HPIxAEviWpOZJEfEfiERa0NR5Qe2ojT0mIHZ5En6CMH3uEqmI4wcN7h84mG29ZSDuCJf
         m4YuJyLjTqJbq4LZnS02ps1Z93vhQTKQJocwhrDynKRkvEtrbdcZV/dUQRqZILNVIUy7
         61KAUFj3MWzCEWpNkYdIovXCYufNdHHZUPSu1+sdZmQfeFg4x6cRNGZEtlFnr0ZNCMA5
         6b7dBc+LP15lOFEKb2YcoVg6GSA6Pv7GV7fL0qoxFOwp1U9YTRTv2Iu21kwv0GLEbUes
         J4FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSoLdyH5cqypoWaeqJSO7speT+menmGZzzTcpoxAUfgJc8ctijWg0Dqb6WljhIJ9jLxKH2Dj1+VIPxsA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/GqLQzIWF4THVw6VU825Uib1I/pfYDijtkej/Y9r4SIFJ52mZ
	rTPbg+jmDwKZdQefJYdcqEJaKtwgWFfuOodJPm4SQQsllIv0YCqJS7a5Ul/laU/rd2LqBLJRue6
	9/p2IdtlfneF4GQlTtKf44anvhKSYBRYJC8J2Jnz+3A==
X-Gm-Gg: AYBFou0US6vAAOQLhQnNV59SjTAcFfQMdJXJzcvBiCK5FCR9rQTelQjnc93otlu+Ls/
	6CK3XBX/s0+8auF5Xvz2SneMUEBaaa2QMAkMaKPvoDKz2fd1kXkZ7E7BnD5uH3qas3nRFlHaBnx
	UeuJPIjQ5pYeLIkFVw5NDofgCIGY7ejZUAC0jnXALWX3mt2GvEOUSzNwg4DyYLTA7bb3wOBAYAY
	maQhoPQNTufdk5kYfn7ScRpf4W2oEtL2JLmVZ3qr4Q98svmrhKNQAWkKcT1hBdVbRMPzwflA7b3
	6g78NG/c+gA4foBO0je++qJcQg+9rq6oo2HbeQQ8phyhosf7Lsvf8UeD7pUJrfMnUKDtwBITCen
	0yAnotyy6iiJvxil0Xj6kL01K9hpXRvOhJypBVWvGxqDLG257L5nwLVWWlCtv29PZTKIU40L0IQ
	==
X-Received: by 2002:a05:600c:3b0a:b0:4a1:6fa9:48ad with SMTP id
 5b1f17b1804b1-4a18e4a9b9amr83263995e9.26.1791622292538; Sat, 10 Oct 2026
 01:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260827211209.2871124-1-dave@stgolabs.net> <CAAhSdy1OUpQUFtQ0Cp0BgSqnxHYUnnCZ0wVsDKz4S57YUa+1cA@mail.gmail.com>
 <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
In-Reply-To: <7d4d21b8-9993-4b76-be0e-2a3b76c0d0f5@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 10 Oct 2026 10:51:21 +0200
X-Gm-Features: AclHuK-5wyIphSA0Dve82FO0PJ8IbHztaMBSv1TG-JspxEZf9pXBzgsTYnWEWeM
Message-ID: <CAAhSdy371da4PnzHLsqS0WFso6PSUvgsVC+fg_wWFymqZPNREQ@mail.gmail.com>
Subject: Re: [PATCH] riscv/kvm: Only context-switch senvcfg where it exists
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_015134_697073_3DF70E67 
X-CRM114-Status: GOOD (  20.41  )
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

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTA6MjPigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gMjAyNi0xMC0w
OSA5OjIzIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gVGh1LCBBdWcgMjcsIDIwMjYgYXQg
MTE6MTLigK9QTSBEYXZpZGxvaHIgQnVlc28gPGRhdmVAc3Rnb2xhYnMubmV0PiB3cm90ZToKPiA+
Pgo+ID4+IHNlbnZjZmcgYXJyaXZlZCBpbiBwcml2aWxlZ2VkIHNwZWMgMS4xMiwgYnV0IEgtY2Fw
YWJsZSBjb3JlcyBvbiBhCj4gPj4gMS4xMSBiYXNlIGV4aXN0LCBpZTogc2lmaXZlIFA1MDAgKEVT
V0lOIEVJQzc3MDBYKSBpbXBsZW1lbnRzIHRoZQo+ID4+IGh5cGVydmlzb3IgZXh0ZW5zaW9uIHll
dCBoYXMgbm8gc2VudmNmZy4gS1ZNIHN3YXBzIHRoZSBDU1IKPiA+PiB1bmNvbmRpdGlvbmFsbHkg
b24gZXZlcnkgdkNQVSBlbnRyeSwgcGFuaWNpbmcgdGhlIGhvc3QgdXBvbiBhIGd1ZXN0Cj4gPj4g
ZXhlY3V0aW5nIGl0cyBmaXJzdCBpbnN0cnVjdGlvbjoKPiA+Pgo+ID4+ICAgT29wcyAtIGlsbGVn
YWwgaW5zdHJ1Y3Rpb24gWyMxXQo+ID4+ICAgTW9kdWxlcyBsaW5rZWQgaW46IGt2bQo+ID4+ICAg
Q1BVOiAyIFVJRDogMCBQSUQ6IDEyNyBDb21tOiBxZW11LXN5c3RlbS1yaXMgTm90IHRhaW50ZWQg
Ny4yLjAta3ZtNzNidWcrICM0IFBSRUVNUFRMQVpZCj4gPj4gICBIYXJkd2FyZSBuYW1lOiBVbmtu
b3duIFVua25vd24gUHJvZHVjdC9Vbmtub3duIFByb2R1Y3QsIEJJT1MgMjAyNC4wMSAwMS8wMS8y
MDI0Cj4gPj4gICBlcGMgOiBrdm1fcmlzY3ZfdmNwdV9lbnRlcl9leGl0KzB4MjYvMHhjZjggW2t2
bV0KPiA+PiAgICByYSA6IGt2bV9hcmNoX3ZjcHVfaW9jdGxfcnVuKzB4NGNlLzB4NWE2IFtrdm1d
Cj4gPj4gICBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAxMGE3OTdm
MyBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMgo+ID4+ICAgWzxmZmZmZmZmZjAxZGY0MzJlPl0ga3Zt
X3Jpc2N2X3ZjcHVfZW50ZXJfZXhpdCsweDI2LzB4Y2Y4IFtrdm1dCj4gPj4gICBbPGZmZmZmZmZm
MDFkZWIzYjA+XSBrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bisweDRjZS8weDVhNiBba3ZtXQo+ID4+
ICAgWzxmZmZmZmZmZjAxZGQ3OTE0Pl0ga3ZtX3ZjcHVfaW9jdGwrMHgxODAvMHg1ZTQgW2t2bV0K
PiA+PiAgIFs8ZmZmZmZmZmY4MDI1NzAyZT5dIF9fcmlzY3Zfc3lzX2lvY3RsKzB4ODQvMHg5YQo+
ID4+ICAgWzxmZmZmZmZmZjgwZGZkYzcyPl0gZG9fdHJhcF9lY2FsbF91KzB4MWQ4LzB4MzhhCj4g
Pj4gICBbPGZmZmZmZmZmODBlMDg2NDQ+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTY4LzB4MTc0Cj4g
Pj4gICBDb2RlOiA4NGFhIDg5MmUgYjcwMyA4ODg3IDE3NzMgMTA2NyAzMDIzIDE2ZTUgYjc4MyA4
OTA3ICg5N2YzKSAxMGE3Cj4gPj4KPiA+PiBUb3VjaCB0aGUgQ1NSIG9ubHkgd2hlbiBSSVNDVl9J
U0FfRVhUX1hMSU5VWEVOVkNGRyBpcyBzZXQsIHNpbWlsYXIKPiA+PiB0byBfX3N3aXRjaF90b19l
bnZjZmcoKSBhcyB3ZWxsIGFzIG90aGVyIHN3YXBzIGNvbmRpdGlvbmFsIG9uCj4gPj4gdGhlaXIg
ZXh0ZW50aW9ucy4KPiA+Pgo+ID4+IEZpeGVzOiBkYjNjMDFjN2EzMDggKCJSSVNDVjogS1ZNOiBB
ZGQgc2VudmNmZyBjb250ZXh0IHNhdmUvcmVzdG9yZSIpCj4gPj4gU2lnbmVkLW9mZi1ieTogRGF2
aWRsb2hyIEJ1ZXNvIDxkYXZlQHN0Z29sYWJzLm5ldD4KPiA+Cj4gPiBZb3VyIHBhdGNoIGlzIG9u
bHkgY2hlY2tpbmcgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcgd2hlbgo+ID4gc2F2aW5nL3Jl
c3RvcmluZyBzZW52Y2ZnIGJ1dCBub3QgY2hlY2tpbmcgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZD
RkcKPiA+IHdoZW4gYWNjZXNzaW5nIGhlbnZjZmcuIFRoaXMgdGVsbHMgbWUgdGhhdCBQNTAwIHNv
bWVob3cgbWFuYWdlcyB0bwo+ID4gaW1wbGVtZW50IGhlbnZjZmcgYnV0IGZvcmdvdCB0byBpbXBs
ZW1lbnQgc2VudmNmZy4gQ2xlYXJseSwgY2hlY2tpbmcKPiA+IFJJU0NWX0lTQV9FWFRfWExJTlVY
RU5WQ0ZHIGlzIG5vdCB0aGUgcmlnaHQgYXBwcm9hY2guCj4KPiBBcyB0aGUgb3RoZXIgcmVwbGll
cyBoYXZlIG1lbnRpb25lZCwgdGhpcyBnZW5lcmF0aW9uIG9mIFA1NTAgZG9lcyBub3QgaW1wbGVt
ZW50Cj4gaGVudmNmZyBlaXRoZXIuIEkgYmVsaWV2ZSBjaGVja2luZyBSSVNDVl9JU0FfRVhUX1hM
SU5VWEVOVkNGRyB3b3VsZCBiZQo+IHN1ZmZpY2llbnQgaGVyZS4gVGhlIG9ubHkgY29uY2VybiBp
cyB0aGF0IHJpc2N2LGlzYS1leHRlbnNpb25zID0gImgiCj4gc3BlY2lmaWNhbGx5IHJlZmVyZW5j
ZXMgSVNBIHZlcnNpb24gMjAyMTEyMDMsIHdoaWNoIGluY2x1ZGVzIFNzMXAxMiwgc28KPiBSSVND
Vl9JU0FfRVhUX0ggc2hvdWxkIGltcGx5IFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHLgoKWWVz
LCB0aGlzIHdhcyBteSBuZXh0IGNvbW1lbnQgYXMgd2VsbC4gUHJlc2VuY2Ugb2YgSC1leHRlbnNp
b24gc2hvdWxkCmltcGx5IFhMSU5VWEVOVkNGRyBkdWUgaGVudmNmZyBDU1IuCgo+Cj4gPiBJbnN0
ZWFkLCBJIHN1Z2dlc3QgaW50cm9kdWNpbmcgc3RhdGljLWtleSBrdm1fcmlzY3Zfbm9fc2VudmNm
ZyBhbmQgc2V0Cj4gPiBpdCBvbmx5IGZvciBQNTAwIChFU1dJTiBFSUM3NzAwWCkgaW4ga3ZtX3Jp
c2N2X3NldHVwX3ZlbmRvcl9mZWF0dXJlcygpLgo+ID4gQWxzbywgZG9uJ3Qgc2F2ZS9yZXN0b3Jl
IHNlbnZjZmcgQ1NSIG9ubHkgd2hlbiBrdm1fcmlzY3Zfbm9fc2VudmNmZyBpcwo+ID4gc2V0Lgo+
Cj4gT3IgbWF5YmUgd2Ugc2hvdWxkIGFkZCBhIG5ldyByaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJo
MHA2IiBvciBzaW1pbGFyLiBUaGlzCj4gd291bGQgbm90IGltcGx5IFJJU0NWX0lTQV9FWFRfWExJ
TlVYRU5WQ0ZHIGJ1dCB3b3VsZCBvdGhlcndpc2UgYmUgdGhlIHNhbWUgdGhlCj4gc2FtZSBhcyAi
aCIuCgpJdHMgbm90IGxpa2Ugd2Ugd2lsbCBoYXZlIG1vcmUgUklTQy1WIENQVXMgd2l0aCBILWV4
dGVuc2lvbiB2MC42IHNvCmxldCdzIG5vdCBpbnRyb2R1Y2Ugc3ludGhldGljICJoMHA2IiBpc2Eg
ZXh0ZW5zaW9uLgoKSSB0aGluayBoYXZpbmcgc3RhdGljLWtleSBrdm1fcmlzY3Zfbm9feGVudmNm
ZyBpcyBtdWNoIGNsZWFuZXIKYmVjYXVzZSB3ZSBhbHJlYWR5IGhhdmUga3ZtX3Jpc2N2X3Zzc3Rh
Z2VfdGxiX25vX2dwYSB3aGljaAppcyBhbm90aGVyIHdvcmstYXJvdW5kLiBUaGUga3ZtX3Jpc2N2
X25vX3hlbnZjZmcgd2lsbCBiZSBkaWFibGVkCmJ5IGRlZmF1bHQgYW5kIHdpbGwgYmUgZW5hYmxl
ZCBvbmx5IGZvciBQNTAwIChFU1dJTiBFSUM3NzAwWCkuCgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
