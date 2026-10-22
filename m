Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03ED8606A319
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CJ2ziXui;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NMifBLZB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jslo1a9S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlUXDlvt2AdumVbd0WhsXHFt+fvgS9QjANlMc1KbrrM=; b=CJ2ziXuiSXX1Fn
	tgxqwwctB0wAr4m7NZX/mabr65elaCZCkrZzuXas+iTM25kosTdvd3+es5g38EP2zs+3DVVbRG4h3
	ZIQJ5ur+mQYnFmKKkcbhySLwA7CFE/sA4ShdBJ9hrSn2d3YLsr+zS9O2EIvlBOlDTmatrICPvRtZi
	rDV7uG00snQDmFAPQx9Y8VytViQD1XtXpAu0pKdZ3MEsvhFl6hYH+37Gpo0K8u0Wr+26ir2Rydpi0
	ZRlP6tRt0ztR/zKhhBFtEHowqlkFa16sNdZ4rwLeNsMtSm/rVjtaVl4q9B4sVnmsfCBTeBypKFH0Q
	fAuRl5adcT9XtgAvBZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlMq-0000000DOQu-40q3;
	Thu, 22 Oct 2026 05:29:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlMo-0000000DOPv-2MOg
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:29:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jjag2297002
	for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 05:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=; b=NMifBLZBvyNscsIS
	OlUvMCfKkwPCFkBrMlfc7wd2xwjWS83v9cCeScE1nB6BCWn5HCDwe/Tiw8VDEg4d
	+3sqA44Bv5Hy6mnTkOeUqHsMdcfDTWCBgaxzOzveOc1lqCsE3Ea/7YsLgmTzf46M
	z4ryNy9OOwLujW6rFsRP4E5zITTRbakLd1U6cPhRO14HAk/F/nP+goKmIhTfwXZL
	CNpUHfBbQfJYO0RgUCm8iXkBc5jDVCqftFHYhYgHc3VPVC2wMLNhl2jUK4eM7Anv
	y4pEupXJmpgtUeE+3RG9vHFZs7cMiLTtcevvnw0CXLLIi1SlCGltQREdCvY5UzcZ
	csveKw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93brt9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 05:29:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so3410713eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646968; cv=none;
        d=google.com; s=arc-20260327;
        b=IJl5ogWcn6wNY+bGPN70n7pZ0iXMbru1JeHzP0zI6ZrHw30lwnMfflrHzvZC/O0ALN
         PH6P9B1Z784QyK5FKsQfGvFLG3iYojEctHXd63d7zgSpaL0dHukQ9JsHJlB78jK/ccbG
         Jdqv+cUcKNfMh8WmSlGMGdQeOdG9B7nr58n0ywqrmVfLcF+MASLxOS5y5pkub358X+Z3
         0HmkwMApdu2U2vdZM5JjEg5gAveSEG4R0whpBPeh7LmdSoTAarV9AcBP7USvmjd1P9Dr
         d1i3xZ+B7PXChP7pmO2mI9Ct98kuYx3DcRxTGOnUUVyxyp0zv6L7x1Up7L+qMr4Vxk77
         +Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        fh=hRPTGLYilnYLyceAmFSnyTVK8j2fJ+lH5jeIhhDJhXM=;
        b=kJHWITh7czBg3RFr1g1cg3xjd+aB2rGp1EHs7TcLbhjAuqDMOH+tkbCbJPNGx791Uz
         jeO7tIgF+rLcVVdqlDIvIBc+0OXritfRZAR+FkrIJO7Wr6cy9QHuFkbTRJ5eEgp1pPP5
         DYTnztuwx8vfTKOK4tVaZN4JWx6GTjBkkKNjIUaJuiPINBsdoW6yQDaVaQZVIL/e2Koz
         ZSGykYwqSsl8fmqBZmiiOPaeByB8Xn2DGadDJSnSqiwNG61b97JFVcCyt+tgYl+DAPSQ
         2EBYzkZ6CXvBQX0sllOv01w6xLNvqjVa+XCXHb96tSHuQDHCYhrMc8JreR3Oc5LsJyY/
         BuQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792646968; x=1793251768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        b=Jslo1a9ShEvPr31MFSHKNWoC/AuqPDpjco+Ehd9kg26I43UyOhS4o1AIRX7LlQRv+p
         4OURL5LrTzDKcl5gxt2ysqyKuVJFU1vRIGXJi180/rCklIWvl2ZHSMa43DjLcYvmYMbo
         /b+PKMsSBUfZgA3GCQE39aCdMK9aR2Hfa4rRTsDbl7djdF4NDiODdBH3R2mXgz5GsQ0I
         Uc5fmXfRHaHxpeI1lppX9jGuMezWJCSl1xTwYLVMH8CDWlNrFJfZvmPbNdJLdRjUSJ0k
         WAHgeNN8pL+6cUjRstUGai9MoLGXzczRkfHXdC6zhBI2mcaiWOUiG8kq2MFu+m1Gs8/z
         SbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646968; x=1793251768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        b=T7di4X7KOvCr/86EFTyRi4hz254w1PyWcofxehEaxKZdnnQvulidMdcXXEkwZWyj0c
         RfS9TpdSU2buvhxDvLREagu+Kan/cUw8mL3YtHlBDV1STWncIuyLOV2goG1hbwIL5tCx
         EiDBlDVkIjQSj9sVtXv3DnqQPX4+VNXWb9BLdsrHaKudmdjEJf7+Dwy6cX56HWfpeGnx
         PAJL0P/ORb6GhRZqU+zXKewwp7i73iDPcZpHONRqyWpCL2yIOzOdZVCXhs4Chf5grzKM
         DTnL3Zu+zfJYWN7yyWwONE8x10+P9IfpsRbmD4rWma+KiYp6VCzlTkcb786u3m5MmTNb
         /1yA==
X-Forwarded-Encrypted: i=1; AKwUvByDsHKzG+uHn4/RmVCvguLAhCIsW73rtRSAdChX1Zh+JZ0Y+Yyv5q2S1QPKCDQXPgUY/e6Btn9uJ/WP+w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKrOY9NTimUfBnYYZ2yuQ4206v6m5ykhvbwl2B6NgCTKsw4mUl7
	0n9MbLb0Kf1VSYAgW//vuyOe1TYwMTzd3fghfCJD5UQtpYrZCbApm6CXgaR/cWy0j9182ZgBcmh
	yiipKGRVFn9UN/c4tUrSoyUTKkZf9DtaEZ4r7NV+5d4m/DCDWJxOrPx8jKm2LYEi4lJICS4Qdn/
	DIPOatZk8BaocR+tM2urUISVY+8Wm/wNXioTSA/60SD2MVuw==
X-Gm-Gg: AYBFou32naWgAtoTbIozFvAitPUOqHjKVWvPq5K8+HFC0aolF7nIx8dx8SLIWh9GXzd
	wfUr6zYADT0inbH/Jxt/2+Ea+GiHMW1KDdxf9ru1sSq5Ue/sIa0I4JqZaNk51spwUFPkPTe4spf
	RP98siNi2HI29GC1gkIaVO/S98qQ2V8qhoKFknUo4XKhiqvfsp2reBP+xV4vA=
X-Received: by 2002:a05:7301:7a08:b0:368:a679:7fcf with SMTP id 5a478bee46e88-368a679852cmr1863340eec.25.1792646967817;
        Wed, 21 Oct 2026 22:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:7a08:b0:368:a679:7fcf with SMTP id
 5a478bee46e88-368a679852cmr1863324eec.25.1792646967328; Wed, 21 Oct 2026
 22:29:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
In-Reply-To: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:59:15 +0530
X-Gm-Features: AclHuK_iYzosfJ5Dr7--r4SAxXJKbvTYWI4tQYeVRKuVqR1ywsT80cvntNZ8DOA
Message-ID: <CABBgwmtE4ZX+wAs9aRTeUDGkWtyfgpF_Ou-Kb5UoFXE88zdkog@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Don't write MMIO load result to x0
To: Stefan Butz <mail@butz.st>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
        Yifei Jiang <jiangyifei@huawei.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-GUID: WjizJlYe2ogq9UO-w5kbejWLC5emwznm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfXyGew/CFvdUXU
 iIcYJVlPyu3pc1BD7hq5Ggyla3KYhjDjPHidnP7ZXWtN0lWyDrKNuOPnk/1m9GakYXgJ43Fmt0U
 N2hVNYalFHI3tc5Ht2hx+cU1zTP2VGy3KAhIkLT6k/oQxxhsJj4/5L+AdBglHTnzHuvLRc3ag2I
 rL3M33SVqr57iMKO1qEBtV2Khgzb9a+rxM5cIm0oxav/RYOyCcOOqx+jfZyQYENazlpHrtEXluX
 8lNL7kbyZokptYVxlVgICkPuiGPPBB2VnfkpeLvASeejcI4Lc5TkwddT0BnMXbS01oKsfWpjo/k
 wJ6C9RNoXqmYGOg0GibkIprlxrEpSHWTpjPxY7ojH1c57GXmieIt3wLpxxSx/V77oixWIvSi2hC
 fKG23JuQ3vVk7lAllOljq9Wydr/hUFss+z575bsXeHJWutlE/rYcZrjZFOour702sJb4zxrZT8x
 CctX22c8m3qXNw/64pg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad99f38 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=W-_n0kkjAAAA:8 a=OiFHV6dps91ajMyZhnoA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfX0SUI9YDoj/Sk
 Dk3jx/zW8OLPSphm5V2VXsYRBBJpH53NDRkLAI7p9JxqPBq752TtjSJQl9RkyK8wKiceZv6+o9j
 iDySNwu1IvQl+pM3Xpq+c9GCHovqevo=
X-Proofpoint-ORIG-GUID: WjizJlYe2ogq9UO-w5kbejWLC5emwznm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_222930_714904_3D536FD7 
X-CRM114-Status: GOOD (  18.39  )
X-Spam-Score: -2.8 (--)
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxOjA14oCvUE0gU3RlZmFuIEJ1dHogPG1haWxAYnV0ei5z
dD4gd3JvdGU6Cj4KPiBBbiBNTUlPIGxvYWQgd2l0aCByZD14MCB3cml0ZXMgdGhlIHJlc3VsdCBp
bnRvIGd1ZXN0X2NvbnRleHQuemVybywKPiB3aGljaCBpcyBuZXZlciBjbGVhcmVkLCBzbyBsYXRl
ciBlbXVsYXRlZCByZWFkcyBvZiB4MCByZXR1cm4gZ2FyYmFnZS4KPgo+IEZpeGVzOiA5ZjcwMTMy
NjUxMTIgKCJSSVNDLVY6IEtWTTogSGFuZGxlIE1NSU8gZXhpdHMgZm9yIFZDUFUiKQo+Cj4gU2ln
bmVkLW9mZi1ieTogU3RlZmFuIEJ1dHogPG1haWxAYnV0ei5zdD4KPiAtLS0KPiBBbiBNTUlPIGxv
YWQgd2l0aCByZD14MCB3cml0ZXMgdGhlIHJlc3VsdCBpbnRvIGd1ZXN0X2NvbnRleHQuemVybywK
PiB3aGljaCBpcyBuZXZlciBjbGVhcmVkLCBzbyBsYXRlciBlbXVsYXRlZCByZWFkcyBvZiB4MCBy
ZXR1cm4gZ2FyYmFnZS4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIGZvciBMaW51eC03LjQKClRoYW5rcywKQW51cAoKPiAt
LS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfaW5zbi5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiBpbmRleCBh
ZGJiYjU5YTBmMzYuLjJhOGRjMmI4OGJhOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X2luc24uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jCj4gQEAgLTY0Nyw3
ICs2NDcsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfbW1pb19yZXR1cm4oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKQo+ICAgICAgICAgdmNwdS0+YXJjaC5tbWlvX2Rl
Y29kZS5yZXR1cm5faGFuZGxlZCA9IDE7Cj4gICAgICAgICBpbnNuID0gdmNwdS0+YXJjaC5tbWlv
X2RlY29kZS5pbnNuOwo+Cj4gLSAgICAgICBpZiAocnVuLT5tbWlvLmlzX3dyaXRlKQo+ICsgICAg
ICAgaWYgKHJ1bi0+bW1pby5pc193cml0ZSB8fCAhKChpbnNuID4+IFNIX1JEKSAmIE1BU0tfUlgp
KQo+ICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4KPiAgICAgICAgIGxlbiA9IHZjcHUtPmFy
Y2gubW1pb19kZWNvZGUubGVuOwo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDcyZDNmY2Y4MDJjNDVk
MDBiMzAwZjI1Yjg0OGE5M2MzYTJiZDdjN2UKPiBjaGFuZ2UtaWQ6IDIwMjYxMDAxLWI0LW1taW9f
bG9hZF9wcm90ZWN0X3gwLTVmNWZjMTFlYTUyYQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gU3Rl
ZmFuIEJ1dHogPG1haWxAYnV0ei5zdD4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
