Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAEFFF5106
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kK0EPwmtEeuatthOvXXVWlTY8Ef64mnzar7uanQ50LM=; b=YLDCS69wc0Kbu7
	uzO58wqlhyA45LbO09F+pciw3ofyJMwkTBhRsRbqd89uHNbYh0tHdIwBk7yPKil2WClnOeWnGwLOg
	sMGtgweeIGIDhOuGwIovYLQR0QCEZimG2tFofroTTDtio4207XxgJalZegDlJk+JdmlP5trDzxfRS
	9cpuHWSmTDPn7vheANEs2Q1xcVoaUg4VrMcm5Ud4CIJcuW2eCxJK5ud3SPS8S26/kBCnZ4raKryei
	766IaJcyEViQQjVeX8PeTukjlgcX21wY+ZLm6LgCZwjSCukYAqjhpu6WkdIWULPu4sAgLiygmXyGg
	GW3v0Rrc9XOw/09Gl10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Gp-00000006gzP-0328;
	Tue, 07 Apr 2026 15:23:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8Gm-00000006gyk-3JF3
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 15:23:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CxsqN2580027
	for <linux-riscv@lists.infradead.org>; Tue, 7 Apr 2026 15:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKwygD8oxONOKFDHAp2r/+Nbk7t85NVaN1mVABGy3oI=; b=pzJ7LDPN2bu9AUbr
	8fafvOankWH0AC+Weo20fy76f1+tH0xdj4YHodT8qiULQPxGJ4NzhXuR3Zdb/1Vb
	vt3XIugqHCjTMFQ9NmFvUR3fJ9yGBf+TQWqEw8uwX+oefnKcN0SSsvwATbeG1gV9
	5kGnOsuF5e2e+KOW8q8/bKy11i6+mA5BtZSOBCtkfwu35iWB5RPQUBhM0/sAeSik
	hA3IWRtn2eH/nSsGyGi0CaZ2diCSA55+HKhQJRq/yArNs9abt7kOE6XO6f6Y/kkJ
	oUXikZc15tAba9QU/aBFlLaSxj2U8p+xHKM2SExxvkISpWmUj+2SVx+wa5AqI/Np
	Jpwbkw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmsf3cgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 15:23:11 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-463c632f9a3so9153884b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 08:23:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775575391; cv=none;
        d=google.com; s=arc-20240605;
        b=OvdydYYzJRuhawpGkauPuhFXqZdMbaOEH5Qt77WQ4Akj4mkDnIY6pfVDZbDRJ13e8G
         ngbqLV0sos3WrnmV8IlB5dmjKiWojFBdEOj39JuT7BI2hwNOkTPE6NMtLDuqgk0Io8X7
         A97LWFOGcivpx0QsIsio57psWscI/cDz1OqPtfSJ5ZMvkV3No1OVhh5eop6xh9saPf60
         D9il6gVM4qrhjy//EYuzRK4m0XMCNbJXNuRWSP+UsyNI1VXPAcZP4yKQkQepjWih5rkC
         fdU6iLOYbb1G+JlDKpUCEO8zQkiVccax+Vd/LPvpMY2buhJ7FwAmj6MQWTV+m5zerfhd
         h2kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eKwygD8oxONOKFDHAp2r/+Nbk7t85NVaN1mVABGy3oI=;
        fh=/J7HXTLg2u8MEblAh4+uSZIqbb1FY0q+eH7PIXzOS/U=;
        b=gkZ+KIuWvQkQ8SSvP5+hsej+mvlvuBQxnTlZbQumyo7Nze0M+SZg5xNSYqtb3HDZSE
         ddZF6zkW524kWeic5m+d6E/estW2i3I5HDznL+XnDbHukaq8bvdFF5kUSSvuv+pnIY7f
         07YYW6LKG8Sw26XlDMwOo+P298sVyTmrSLoDlCGA7I18aOgDlShmXuNkjBsM4gZ0NmBd
         Nluh6Ix3litLELv2VtCt4Y+DYlfWRRvZjVajRtIE3NzgI2IcxHyJu6z97PcWs9Mui4RI
         qC0emuDvs9vXLXb//AKUWSijN0YpY5UVjX4j/42H3+eqY56UFwOn/2SYabgl7dFqfPi4
         ximg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775575391; x=1776180191; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKwygD8oxONOKFDHAp2r/+Nbk7t85NVaN1mVABGy3oI=;
        b=a7PY3JLxgs2LK7Cwu4bsm1g8JOEKdrWfcVqJX2WdUuPmWaexmhCjWOJrSTs9bioMsW
         lzhfTqiIlXSaam2P3vdg2hM/TVEN11vwj2ou+sssTmRG2oTLnxrc77LVJbQjP4BwC3FU
         jyqwHVcJOE+P2Pk+A8fZo8FLy+jdHgc+DSc3d3CQ15MQjwtKmKR45+np4uwkE9nY7ja5
         NFNZ+iNCAoNA3GUvxVIQQQez7y4mAMRdgVeX20IA8BlfjM2lEv/Gm++isjciWhuh+NMu
         UI9Rp3jyeuQogFhztwsvn5mCMgsKK/xpikcBckaKgyK+QE0T8Lm230Aa08Jzwi1Tow/l
         kn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575391; x=1776180191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eKwygD8oxONOKFDHAp2r/+Nbk7t85NVaN1mVABGy3oI=;
        b=NU3xM7RnYH7YyPTICJ2QCg4V2TMP9yZPHWHP1BfGS8uCHSqsjFfH7SBcSLaT8OksAP
         3pFqJQSMjfvpK51RiiUsBarZ8RJSbRnjPXs/vZqpAFbyWTkmA173zU6zVzvc6K7BsVJk
         oZeo9vu3N7pFem5/VUst3GrXpquAds/GkmN33oceqq0q0D/SsXTELth1b42QHXcPH0xe
         axWXpxFphkoU+0UaeArFkZEoj/k71Q5YqRMtuK7FC10G91VZXxqcJGjkMsOG0Ri82IBq
         LjpPUZGSNph55IbjTUt8sSiTvvb+uclI11vr7okoZZ2oYRGiilXUrgyFEIAetpyTyZjS
         iPug==
X-Gm-Message-State: AOJu0Yz5a4f1hVeoNeV4dGzWuWhgr4UQ2bftZY4oAsLLS90R7MTd4K8p
	qwEVlwADvxEJkW1Fqopg7uGozx2FJZ19fppX9wDtPzbAfB22e0ZMKuDEJhyJiJL9y56DiGyRyxW
	DpYkgvHL15GUg4y8caU9EBrbBpuPXIWZF06bvII/hUYVc9XvyRM+oFAldU0wmYdiHkL9T8VPudC
	nki21jA/Qr71eOhck/0da5gr3BSeBbAoGb4iQO6UIphH+lbg==
X-Gm-Gg: AeBDieuUlCO4wqeJJijKshtqgcGZnzByXfuwySUoHhQTQgK+ZRD4ObiRjoml/7HERy2
	rlQasluVElS7ZWjU0ICP1dtmdC5GlTK8NnIiiDfknv6D3frIEYTZOmDbyp/y6lt2N6bOx2xNgIB
	LLPlGB0q7AATvygvxbDunNbmr1Anp0y43sXhCDqdGJqsq3qrKP1pb1pwU9WE7rKQVIuoTP1i56F
	VwgFbYL
X-Received: by 2002:a05:6808:15a7:b0:467:2f84:b0bf with SMTP id 5614622812f47-46efc3e652cmr10343085b6e.49.1775575391067;
        Tue, 07 Apr 2026 08:23:11 -0700 (PDT)
X-Received: by 2002:a05:6808:15a7:b0:467:2f84:b0bf with SMTP id
 5614622812f47-46efc3e652cmr10343062b6e.49.1775575390616; Tue, 07 Apr 2026
 08:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <20260318120019.z656r53gkv6kulq6@imamay-pc> <CA+Ht8=ZDH+o9ocgDpX+JQ0TQONYn_eVRiEGedeauUoa4tsK6nw@mail.gmail.com>
 <20260407102949.yjsihtpgkau6fndl@imamay-pc>
In-Reply-To: <20260407102949.yjsihtpgkau6fndl@imamay-pc>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 20:52:59 +0530
X-Gm-Features: AQROBzBfdIkHuiPPDkZA1_84_Y6KxIt_9VQWrwT6TWvR0Hjbamc0ovYzD_3VY0s
Message-ID: <CA+Ht8=YYSsZMnTAfUmSsxENFBNjePoMcHsiBpCJvSHm9Xm=mLg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Ilya Mamay <mmamayka01@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE0MCBTYWx0ZWRfXzjHwWDwaYbai
 vf63MsIuYRlpVt3FYfB+ZPrx2uC4UlBsO7AcNiXoYZfRPypXekdXP8R9AtXbXJIswqFm73a5M+v
 XLN09e8waNDRIkw1rZZq68ybWtkH/GnBBnxx5Y856ZzdVqh1MCUdUV8g8lJOpfD6Hvlim/F5OLM
 Lsm+Hl/frZ9ei+EAZQHyyz5RC0GFOLct/NYnYrAYE1r7gTVYVUMhZbu45AWgezJtxiP69N27Oci
 FDxOECUGMYKziS/8cmUN61+oORtnZfay3YLsLmqrYPPN56CnWU6BiN1GpnPX9Cq8JRe4+2r3NFg
 /Lf1inDa0G5xaS14v+CkxiokEqDUvye3qyh8vZ+B0AbgpWeRRntwksQkpmhcFRfMrpBAsfLxpqa
 IqOYMQRQAAAM7qvsteaSz9rmSYe+lnnzbG3JCqnboycRgHKfcH2zO6pZ35gLUaDupxvuUQm5Wb0
 E5Rl9PlkDznLEByEOnw==
X-Proofpoint-ORIG-GUID: hiB-WmLIPcdHYZccWEi0ccBMwUxA6w__
X-Proofpoint-GUID: hiB-WmLIPcdHYZccWEi0ccBMwUxA6w__
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=69d5215f cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=hzcVyx8-FqiQ7Sy0Zp0A:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_03,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_082312_944033_E789FAB7 
X-CRM114-Status: GOOD (  23.42  )
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

SGksCgpPbiBUdWUsIEFwciA3LCAyMDI2IGF0IDM6NTnigK9QTSBJbHlhIE1hbWF5IDxtbWFtYXlr
YTAxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwgSGltYW5zaHUKPgo+IFRoYW5rcyBmb3IgeW91
ciByZXBseS4gSG93ZXZlciwgY291bGQgeW91IHBsZWFzZSBleHBsYWluIHRoZSBhY3R1YWwgcHVy
cG9zZSBvZgo+IHRoaXMgZWNhbGxfbG9jaz8gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSBp
dCBpcyBuZWVkZWQuCgpUaGUgYXJjaF9pbnN0YWxsL3VpbnN0YWxsIGNhbGxzIGNhbiBiZSBjYWxs
ZWQgYXMgcGFydCBvZiBwdHJhY2Ugc3lzdGVtCmNhbGxzLiBUaGlzIHBhdGggY2FuIGJlIHByZWVt
cHRlZCBhbmQgbGVhdmUgdGhlIGluLWtlcm5lbCBzdGF0ZSBvZiB0aGUKaGFyZHdhcmUgYnJlYWtw
b2ludHMgaW5jb25zaXN0ZW50LiBJIGFtIHVzaW5nIHRoZXNlIGZvciB0aGlzIHB1cnBvc2UuCgpS
ZWdhcmRzCkhpbWFuc2h1Cgo+Cj4gT24gTW9uLCBBcHIgMDYsIDIwMjYgYXQgMTA6MjE6MDZBTSAr
MDUzMCwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IE9uIFdlZCwgTWFy
IDE4LCAyMDI2IGF0IDU6MzDigK9QTSBJbHlhIE1hbWF5IDxtbWFtYXlrYTAxQGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpLAo+ID4gPgo+ID4gPiBUaGFuayB5b3UgZm9yIHRoaXMgcGF0
Y2ggLSBpdDtzIGEgdmFsdWFibGUgYWRkaXRpb24gdG8gdGhlIFJJU0MtViBIQlAgc3VwcG9ydC4K
PiA+ID4gSSBoYXZlIG9uZSBxdWVzdGlvbiByZWdhcmRpbmcgdGhlIGxvY2tpbmc6Cj4gPiA+Cj4g
PiA+IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDEwOjE5OjE3QU0gKzA1MzAsIEhpbWFuc2h1IENo
YXVoYW4gd3JvdGU6Cj4gPiA+ID4gK2ludCBhcmNoX2luc3RhbGxfaHdfYnJlYWtwb2ludChzdHJ1
Y3QgcGVyZl9ldmVudCAqZXZlbnQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICBzdHJ1Y3QgYXJj
aF9od19icmVha3BvaW50ICpicCA9IGNvdW50ZXJfYXJjaF9icChldmVudCk7Cj4gPiA+ID4gKyAg
ICAgdW5pb24gc2JpX2RidHJfc2htZW1fZW50cnkgKnNobWVtID0gdGhpc19jcHVfcHRyKHNiaV9k
YnRyX3NobWVtKTsKPiA+ID4gPiArICAgICBzdHJ1Y3Qgc2JpX2RidHJfZGF0YV9tc2cgKnhtaXQ7
Cj4gPiA+ID4gKyAgICAgc3RydWN0IHNiaV9kYnRyX2lkX21zZyAqcmVjdjsKPiA+ID4gPiArICAg
ICBzdHJ1Y3QgcGVyZl9ldmVudCAqKnNsb3Q7Cj4gPiA+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBp
ZHg7Cj4gPiA+ID4gKyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiA+ID4gKyAgICAgaW50IGVy
ciA9IDA7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSh0aGlz
X2NwdV9wdHIoJmVjYWxsX2xvY2spLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAqdGhpc19jcHVfcHRyKCZlY2FsbF9sb2NrX2ZsYWdzKSk7Cj4gPiA+Cj4gPiA+IENvdWxkIHlv
dSBjbGFyaWZ5IHRoZSBwdXJwb3NlIG9mIHRoZSBlY2FsbF9sb2NrIGluIGFyY2hfaW5zdGFsbF9o
d19icmVha3BvaW50IGFuZAo+ID4gPiBhcmNoX3VwZGF0ZV9od19icmVha3BvaW50PyBXaHkgaXMg
aXQgdXNlZCBvbmx5IGluIHR3byBmdW5jdGlvbnMgbWVudGlvbmVkIGFib3ZlLAo+ID4gPiBidXQg
bm90IGluIG90aGVyIFBNVSBjYWxsYmFja3MgbGlrZSBhcmNoX3VuaW5zdGFsbF9od19icmVha3Bv
aW50Pwo+ID4gPgo+ID4gSSBwcm9iYWJseSBtaXNzZWQgaXQgaW4gYXJjaF91bmluc3RhbGxfaHdf
YnJlYWtwb2ludC4gSSB3aWxsIHRha2UgY2FyZSBvZiBpdC4KPiA+Cj4gPiBUaGFua3MgJiBSZWdh
cmRzCj4gPiBIaW1hbnNodQo+ID4KPiA+ID4gUmVnYXJkcwo+ID4gPiBJbHlhCj4gPiA+Cj4gPiA+
ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4g
PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
