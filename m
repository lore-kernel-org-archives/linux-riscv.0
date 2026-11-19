Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3B606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 15:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=omR2IY1p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=SeX8fOWj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xIaStd4ZkqqiYWH09B3k3WwiXcrZX3n6x9wb6RtoAM8=; b=omR2IY1pJ4/Kej/VAuM1HL7FfN
	RhalJoUYInoyoxlnPeSV4s7XBve/IVOq1+bHok6VYh1h90hk+Lbv03dP5CZy023P9vBxI8StxpYiz
	SLuOO7MWp4LKpW1qTRCAxhaRfiXRf2wISDAQWvf/XvRSp9fHSP7njD+SDqehMzWguaucf18r7Tlyu
	6JRVnnq5EBdtwIQMdTONavGcZ/7SFsvkIjRUHTbqLNOXrUsvWilc+W6I2zEgqzsCJAYOF2/dypXt2
	kyyVP4UF4rgbQW2v/w4J8lK2uwK7bwlcJwBmcWTZNa5d4oH01+2t47E5DRBu73x6XtaenNVNXd4T5
	rtskIwzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3z9-0000000CQzU-046g;
	Thu, 19 Nov 2026 15:23:39 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3z5-0000000CQy4-3geL
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 15:23:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso25078561fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Nov 2026 07:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101813; cv=none;
        d=google.com; s=arc-20260327;
        b=pIOyIIkERzYx6saaixavfkVHwfkoiEAZ/ltxESTL5zjxYte6yG4E59F5zobz0v1Qna
         YVPrnurHBG5spMzsjCL5/Va6XZCdwmwhDOYXL5yg6erixITyKpEEve3w2o5vs6qPjwHe
         K9U3HVuQZTqKzpcXkWCQT7zlbgPtFPAIY1JIw7SfQQIVMp8hsxIbkktoIXBtKv0wPxta
         z1utDJiuiVcOvXTf00nWlsWG7EurSR0HzwogMwdv6c7/aNrrStoZRZKCiQq1Gi2ZPBWs
         DNu2qC0IB0ZkjD/+oekznyjtVvuno2CkJYnsiYwGurBcF36rfyjCjJ4rfOKiALfDxIFK
         9qWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        fh=5ImGaIgAKKMJN2z9DshE3GtIP6c7gXA38SeSaZ1V5FU=;
        b=kxX3ECl8DztlT0lNNtRTy0e5syMo68mQmKpedxWf1teWggAXkg2PWL+qlyrcJLTWN4
         UoN+b8h8crPUqCc8w7fIrnePivkOQJq4uo1HfZrBkvpbnVpxpVB/iJWQbbLfNuFs1q2u
         yZyKVJLtfM756xdgTgptnDQTtJbUPXvAgzCuMdJBUGjfIfiZoqZkbPgUICtdP3bknYB1
         c0N80hI8dJB9m3t24buwgX76mOxhEyYYE2h3HaRIO3xfELiw+Nz3ftaKZbVL5kHp9Jzz
         Scew1i3GrTEkOtsQPClEuFyfUAle+ILGRucn28unnjxe8fgGzaUFXmJkKaza3ZhAoZFE
         YrEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101813; x=1795706613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=SeX8fOWjQJIV2pEi9TjXbUg7NHCa606F9dZiKfllCGcnY+yjr60d1AByGxwsgPIcNt
         oEyt15PIVcwwikBvQtivm/Nl2Ca7kF5cXPvN0AEHmwrBW/57TMG8WV+7Edrd/T1AkW9F
         hKP5fEfFdZ2jQMsjKs8SqdJCaNQ8JC8DUvukyIt+jCuNdBKEKG+5R61sUzdbP/wEjga4
         0Ora4i4VP4a57mOYLzY36lq+571MBB4X5X/dndmesWel68MYaV7AZByKO2FXUXl/ok9n
         sVnFwSmR1GMNMyuHrrOUOfIan69gL/j9kSYUOH1Re2n/zGbuHcXTDvj1dDoE2CqUOmNu
         U21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101813; x=1795706613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLiIxvGF0pdJOfNUXCqh2sSExtWATR8tTZm0ydTCszg=;
        b=lqVJVYyLWhPTy7LQvRRxCfqroR967Pt7NmTjyqAfnWnw+4wdSgOPnzVkIVTID8WwdM
         mgQ255rD+e8WsRaLWRj2CIMRO78zM1jP3ilK61p9FAwQGIHmvfFNHKnepyDB6UwQVRbO
         tcRk9VskyNydfcXeUOYgf2jD4oR3fr9dlMrXTJU4qX+2M2UMy5M0Q2YBeJ8Bf3KO8x1u
         XZEWtssKkcqhVPDR41rOtnuDTke0+UHAEK4i0L07QBruESTTZQ8r+k8ofXSaJL/KdQDE
         W/RKWuIj4cmfKc/paDWFxlWz9Rct7W2iZs9e5PMOCaKOhxApbQJXIRssHWuOO871xnFi
         pgMg==
X-Forwarded-Encrypted: i=1; AL+hErHdVtMYrW94rVh/THZo/PzwtEvOFvyv4Qp58JjNRda5Jh+zJdrJ/h3VMVq3OI7Sm6VbDrHV6IfPK0Li/Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+3iuGBLbCWwzxwjXk8sIOvLGZYBRwhJQQfpRTGpylclSMZ9i+i
	37BnngJhyc9gHkB1Gtwr11sRYcAE5Kyva6WtI1ryoR0C58v9C3mHz6SIbgqy49wbFxqrxBLwkkU
	4pSFFqBWQNKBhV1mq67g1xD9qlM17UzAvYPvBJCW/4A==
X-Gm-Gg: AYBFou1BvLtFry9RleAIlXiaowyJHOeP+8pgft+vSf335edfPL6/0qiczYH58kG8Adj
	C8p8ICE9U08yOUcSeRW9xlQL0uEkfLBtaRdZRNzpMC+yC24CYMQvBIsD1otQV+NoZ4avHLeCfA9
	zOKixUCMN9b6E4DaSU4eC6mCw6mjG29rxRHrWminxp8OXg9CwJ5ig3+kVPqcQzR7FwIV2G7NiTr
	/yUyzr8locGV2b2R+g8+PKq1eX32KM+R6KDAF58M/QgXnXNJnMtWc7Q1jdXbAndPUcUHlmqlfHJ
	6zZykcsMr+m1w7OAEUt1ivi8AsL3OpYA8kfkqclqIU9WTwyGNL4BluDd/tReNq/aLHa2dOQtF98
	BPl9+4w4qQD0VVo9upiD7q1sRYijCbi93QQ/A0AuBehxPkBDdxt+vP5j414evCcwFtFuFeexCzp
	El5ifMUdWfo8vRqDb5ZZ0U3+zrRBYpBMgciNzMPDEvPp+J7sN/Q+B4PJg=
X-Received: by 2002:a2e:bd05:0:b0:3a6:6d05:7375 with SMTP id
 38308e7fff4ca-3ae7f9d5f2bmr884941fa.8.1795101813092; Thu, 19 Nov 2026
 07:23:33 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-4-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:53:20 +0530
X-Gm-Features: AclHuK-bYeekeWya8STnw2Y8eECaMfbCySlAAK-yinBr0JM6XHZ34xL9AEfbGuQ
Message-ID: <CAAhSdy3TtQCE8Fa5FitihgSKewXLApPOOhWHU1QCw=6F-P_4=g@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] riscv: Add Control Transfer Records extension parsing
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_072335_982824_152B0B7A 
X-CRM114-Status: GOOD (  12.93  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMzoyMeKAr1BNIFZpa3JhbSBTaW5naAo8dmlrcmFtLnNp
bmdoM0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEFkZGluZyBDVFIgZXh0ZW5zaW9uIGlu
IElTQSBleHRlbnNpb24gbWFwIHRvIGxvb2t1cCBmb3IgZXh0ZW5zaW9uCj4gYXZhaWxhYmlsaXR5
Lgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBSYWpuZXNoIEthbndhbCA8cmFqbmVzaC5rYW53YWw0OUBn
bWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmFqbmVzaCBLYW53YWwgPHJham5lc2gua2Fud2Fs
NDlAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZpa3JhbSBTaW5naCA8dmlrcmFtLnNpbmdo
M0Bvc3MucXVhbGNvbW0uY29tPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NjExMDYxNzM5NDIuMzE3NTA2OS00LXZpa3JhbS5zaW5naDNAb3NzLnF1YWxjb21tLmNvbQo+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcyBtZW50aW9u
ZWQgaW4gUEFUQ0gxLCBkcm9wIHRoZSAiTGluazoiIGFuZCB0aGUgc3Vic2VxdWVudAoiU2lnbmVk
LW9mZi1ieToiIGxpbmVzLgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
IHwgNiArKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+
IGluZGV4IGI1OTUyZGI5MjU5Zi4uZWUyMDBkOGNmY2NiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaAo+IEBAIC0xMjYsNiArMTI2LDEwIEBACj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUM2
NEIgICAgICAgICAgIDExNgo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1Y0OCAgICAgICAgICAg
ICAxMTcKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NWNTcgICAgICAgICAgICAgMTE4Cj4gKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9TU1BFU0EgICAgICAgICAgIDExOQo+ICsjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfU1NQTENPRkkgICAgICAgICAxMjAKClRoZXNlIHR3byBkb2VzIG5vdCBiZWxvbmcg
aW4gdGhpcyBwYXRjaC4KCj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TTUNUUiAgICAgICAgICAg
IDEyMQo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU1NDVFIgICAgICAgICAgICAxMjIKPgo+ICAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHICAgICAxMjcKPgo+IEBAIC0xMzYsMTAg
KzE0MCwxMiBAQAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU3hBSUEgICAgICAgICAgICBSSVND
Vl9JU0FfRVhUX1NNQUlBCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TVVBNICAgICAgICAgICAg
IFJJU0NWX0lTQV9FWFRfU01OUE0KPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1N4Q1NSSU5EICAg
ICAgICAgUklTQ1ZfSVNBX0VYVF9TTUNTUklORAo+ICsjZGVmaW5lIFJJU0NWX0lTQV9FWFRfU3hD
VFIgICAgICAgICAgICBSSVNDVl9JU0FfRVhUX1NNQ1RSCj4gICNlbHNlCj4gICNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9TeEFJQSAgICAgICAgICAgIFJJU0NWX0lTQV9FWFRfU1NBSUEKPiAgI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1NVUE0gICAgICAgICAgICAgUklTQ1ZfSVNBX0VYVF9TU05QTQo+ICAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfU3hDU1JJTkQgICAgICAgICBSSVNDVl9JU0FfRVhUX1NTQ1NS
SU5ECj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TeENUUiAgICAgICAgICAgIFJJU0NWX0lTQV9F
WFRfU1NDVFIKPiAgI2VuZGlmCj4KPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfSFdDQVBfSCAqLwo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCA3MmJjZTYxNjQ5MWYuLmIzZTNjMzBmNGM4YiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtNjUyLDYgKzY1Miw3IEBAIGNvbnN0IHN0
cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ICAgICAgICAgX19S
SVNDVl9JU0FfRVhUX0RBVEEoc21tcG0sIFJJU0NWX0lTQV9FWFRfU01NUE0pLAo+ICAgICAgICAg
X19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHNtbnBtLCBSSVNDVl9JU0FfRVhUX1NNTlBNLCByaXNj
dl94bGludXhlbnZjZmdfZXh0cyksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0
YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01TVEFURUVOKSwKPiArICAgICAgIF9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHNtY3RyLCBSSVNDVl9JU0FfRVhUX1NNQ1RSKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKPiAgICAgICAgIF9fUklTQ1Zf
SVNBX0VYVF9EQVRBX1ZBTElEQVRFKHNzY2NmZywgUklTQ1ZfSVNBX0VYVF9TU0NDRkcsIHJpc2N2
X2V4dF9zc2NjZmdfdmFsaWRhdGUpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Nj
b2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQTUYpLAo+IEBAIC02NTksNiArNjYwLDcgQEAgY29u
c3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfZXh0W10gPSB7Cj4gICAgICAg
ICBfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVQoc3NucG0sIFJJU0NWX0lTQV9FWFRfU1NOUE0sIHJp
c2N2X3hsaW51eGVudmNmZ19leHRzKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNz
cW9zaWQsIFJJU0NWX0lTQV9FWFRfU1NRT1NJRCksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRf
REFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAo+ICsgICAgICAgX19SSVNDVl9JU0FfRVhU
X0RBVEEoc3NjdHIsIFJJU0NWX0lTQV9FWFRfU1NDVFIpLAo+ICAgICAgICAgX19SSVNDVl9JU0Ff
RVhUX0RBVEEoc3ZhZGUsIFJJU0NWX0lTQV9FWFRfU1ZBREUpLAo+ICAgICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEFfVkFMSURBVEUoc3ZhZHUsIFJJU0NWX0lTQV9FWFRfU1ZBRFUsIHJpc2N2X2V4
dF9zdmFkdV92YWxpZGF0ZSksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdmludmFs
LCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpLAo+IC0tCj4gMi40My4wCj4KClJlZ2FyZHMsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
