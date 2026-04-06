Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EAAE9D835
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 04:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUK/F3gE1xMnN9A/ppbbO+iZ4ylUzziAMegHojijvnk=; b=Ntj8N9GiaY6Txd
	Mt5PwRgCCMj8bqfiThr0IabbVzyMCQaWibYLhoxTys2z/3swqLxQja1FqHMMhswLB+1Oi2Qjtq/cg
	NfyM3fYduM/4hdt+yo+fggrLpMaUN+FAChb1W7t36Tu61nS+v8r+Hzaty0HjN6ccNvUYdMxroVgZX
	JoHuXA2ef+N3kC28+YxMEjyOIWKB7vHcgqjiStGncqoAz8O32Ti8xwm1hSUsgtWSiao7RJbsBVuG6
	wh6/FZpej9qmvSnc3YvyFR+HGmhQ4m4euSw074Vv9sglsjnLs/MoMSu9S6s+kdRPnK9EK0o6IVEcL
	aoXiqXturj+KXJSQ4LfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9buE-00000004mK5-1OFY;
	Mon, 06 Apr 2026 04:49:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9buB-00000004mJJ-2vxD
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 04:49:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635ATv0V3204592
	for <linux-riscv@lists.infradead.org>; Mon, 6 Apr 2026 04:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Ts6gzP+WTI2TSIzdXxp/u9dvCqvXbl8XI6nmdq1S1s=; b=IvVS8dlcttQXn4Eg
	A8MquoEThs2GTJXnad5+sgcgWu6xus69nf7NO0lLwe/T+4NlVGzI+d115z6MFng9
	y0yFrIDSk1yxh5ZVlVM2/wkRIKRg8VMTroGLMcmfJ3Zm63/ZzFwnrTe+J6Mig7xJ
	+BYJSeHTMQSKBtvq1m04N/P6vEwFBZ6frvrFO3LaRuM7KRO3DAuaGAiVT5OH7JZP
	pbs8aV8DIJGz71dUazkfeOaM6OAQwWTW9HykykjMp5BCYOF1GtlL0OpJbK4TsBtz
	8/UccxR/TnWE3KwrBmfqEFUO1ubjY47MTB/8ERT9HB1GHyZe6yHFUL6eNto2nUry
	umrfjg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqskshm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 04:49:42 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-471618e2082so294943b6e.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 21:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775450982; cv=none;
        d=google.com; s=arc-20240605;
        b=loVg+fH58869h9y87L/OWPzdbXsWavMxuv53iNJtn1OsW59qZzZKARp6p7IRzJ6R5y
         68casT7+LzXzM/ro0wi2mdKh5JKujzcaS05WnuQWBOl+q2pPAjr/hoHMHe6iEujGN/XZ
         /sZswY7BPf/Uf+xZi6uMBhP73OoLxptgb9sjt5T3A3BidPLjFMfIfLGFtPPvg94fqzxD
         vDEJd7SLXHxleUQMCN+NSy9KsKeFXRNmBc3KS0ZPVP3wy0tPHp/9NuVDr+qjoWCW1/0V
         b43Mw+jlD7HDS4XeWijGmJFLWvj8ZOguRcyk0kDYABt/r8SGNV9/a0froOehT0wAae1E
         G3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Ts6gzP+WTI2TSIzdXxp/u9dvCqvXbl8XI6nmdq1S1s=;
        fh=/J7HXTLg2u8MEblAh4+uSZIqbb1FY0q+eH7PIXzOS/U=;
        b=Lq/tMfeHTh6ZKPI+BY0epz97bi/U/x8eGHACyWdKD2c/szMQaT+PL1BVMR458T0rnn
         a4mOBbVtdWeb+6Y2EpQyto/cs7EiIvwxkw6nAT/XkIvywlyrtZvQ0zFadgscGxKK4ufW
         cy0mvMYI4eydlMhpNpLc+iyw1xThasgKmpL+8Uw/duYpn6iXd9KMevhVLcWA6gm7ywdM
         R3ZnkeMx5UfIA1OpakfaiTLAMMCei7Bcz003/YrkMVJ6BPZPFueJdI5kQ9Lkyg/Xxqeb
         1Wg5MkfbfDcf0Oc5I0g41sYCLovG0HvK5PP92EV1djmmE33t4Q1++xZvHkdGq4guOa2P
         0k6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775450982; x=1776055782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ts6gzP+WTI2TSIzdXxp/u9dvCqvXbl8XI6nmdq1S1s=;
        b=gDZuVc3yqypu+CrNLslpSVl4zjhDu52ZWSysr2UJdAGvfCIeMJeP48dbYD29rmNO75
         9GW9otZo/oCxafnAzlqSoPiPFJ5WJ1sWck91lX4Uj+JBG+4Y+BZr+Rt+jyrvxAIoZKEP
         DLMRKilLxA0LvW8Iyu1Z51YksM7Wp8VRV9MTZSxd9zUudXfBw/1INBK3N7aJmqd8V8l8
         PMaHLGjB/CZQBp/NSy/yh0W7N2mFWY8R3EGm1/zMIytZlmoL4oubtqXByCXtTTFxAk5U
         LShXAGg8Q+xmDd7eKheo9dZogQDBzttlRauAzgW2OHtkj4hcEG2Ra4EN+M1Pj+Y0xOlu
         wNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775450982; x=1776055782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Ts6gzP+WTI2TSIzdXxp/u9dvCqvXbl8XI6nmdq1S1s=;
        b=QVy6npLyoqPeMV4OIhvabSIIcANqtuw6pXId/NDqk0B07TkLnsZPAQTtbRwSOWyepx
         rB7cURbwsHxWJTDvcshLgKLcbJwz6HOA3SF7uFOV59B0ha/YlV8RsHKHCzhg60Eb7vgf
         BEZ6wz6TrxfrixYsCGk4yc0CiKn/WzJb6we0Lr+KXFGj/ee+ntotZ1O3aYdR7T++2/+Z
         0/jeLi6XfX0hHcXzQYeE3118/g9n0S2TaYEnXKDDygUYhzU24VU7ql4LhxcWVInCRzvf
         fF655hZ3Qc6MiiOLtYBP8d8vwagQEZHVDr4fYN+z7KSpF1c/vMicIC0kbMF6MdfS/TIr
         oOMQ==
X-Gm-Message-State: AOJu0YxYu4szSKotZ7H8EfR7JM2g4+iY5F7RRNEw1BdP5S68jbiw5Iq4
	l3lXfQKgTRIwTDN4vyUKijLPVc8UcCVi+gMdrHgnxoGQ90F1VA9l3nMzd/1nF0jTJU3B+RxpHYw
	oFEB2uLofQqy9f01Ln2ULBt4h5dMFVWbpyUx2tklh6fwS7CcfCnyCkAUr/llwOA9etrq0ZPqFsl
	qUr4BFBfrHN+iM7HT76IC0I0jW/a9ftsbhVQ8lJeuWmMviVg==
X-Gm-Gg: AeBDieudIxSQd5tkjih1b8zojUQTWq1fQBawz+1OhsRzZKbdzCDZ6qQ/kAYTUvpsRMv
	tB0AY51lJjPRyRxjs/mL43aL8cYqI1xQuWWXjoM+4gU6XiTmd+iyBTTtzc78A7sVxczFjN9qjd4
	IJCSrdI8Jb7JF2weKxQfiZjaSIX82zsBE6q9pucXXm8mUC4DSUJjJn3Y1+XWWFWzY4z204pIJJx
	HmIcQs=
X-Received: by 2002:a05:6808:1310:b0:45e:ab45:d226 with SMTP id 5614622812f47-46ef851fa30mr5664121b6e.49.1775450981911;
        Sun, 05 Apr 2026 21:49:41 -0700 (PDT)
X-Received: by 2002:a05:6808:1310:b0:45e:ab45:d226 with SMTP id
 5614622812f47-46ef851fa30mr5664106b6e.49.1775450981463; Sun, 05 Apr 2026
 21:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260223044918.1359983-1-himanshu.chauhan@oss.qualcomm.com>
 <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com> <20260319103629.by3bw3qeev26jvqq@imamay-pc>
In-Reply-To: <20260319103629.by3bw3qeev26jvqq@imamay-pc>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 10:19:30 +0530
X-Gm-Features: AQROBzBFQZpgQxqJaSBcMxeJ46dEqBUm3zNQnNpw4P6K5sOSUE87isxEnbWuMN8
Message-ID: <CA+Ht8=bdEpQTa_7gu0MD43-=eDm-2AESkEVK4F6VTuOVOkzwMA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware break/watchpoints
To: Ilya Mamay <mmamayka01@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, shuah@kernel.org
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d33b66 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8
 a=QfeyqYJBk9WBBFQ2vZQA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: pOYfz78FP-JHLDm86lYbnQuIVI8RdJpc
X-Proofpoint-GUID: pOYfz78FP-JHLDm86lYbnQuIVI8RdJpc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA0MyBTYWx0ZWRfX0Fs7TaVDwDmQ
 Cr7llEn7r7HuYAANsGZcdJeH0MJu1Ny29yE7trEtIhvOraa6YPFhXejrkxByg1EfqHtgCOs1ZtO
 qYwuDOoZnCXnPZOqKukvY3SavJ43VImI/gN64IP94STl+r4WB8ZuvWAFtnEq36LhUxx3B9L6a0M
 j/4gqdHaEEH8RSNyklDltF+3HG/nyuM3kH96SAQOKeLflrX6lNzdsILSXR2bya5eoXBmgM/P35K
 DX5B9Y3dCuSoWUZff1Lp0PIfIBwjAsLVoG0luA3GFUKzkywaF2E+0j1QnPIAFPh5fWxCUp1Zcb7
 Mf4YG5TBEqgpBozp4vH4u+eUDkqyrAXPQ8dQOcNSYkiO/TBmaVA+BHH5H/KFaML6koTwcGAq0sC
 Oz/SBj0q0oVsc8vcmmfmj+ubJRgUwY6jLOV+Sk7B5WmOtHBLYc49N6KJFlZK75ASpN/w4RmCd2S
 V9VcwIgyj3oS03krmdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_214944_137446_90961324 
X-CRM114-Status: GOOD (  31.55  )
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

SGkgSWx5YSwKCk9uIFRodSwgTWFyIDE5LCAyMDI2IGF0IDQ6MDbigK9QTSBJbHlhIE1hbWF5IDxt
bWFtYXlrYTAxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSwgSGltYW5zaHUKPgo+IEkgaGF2ZSBi
ZWVuIHVzaW5nIHlvdXIgcHJldmlvdXMgSEJQIGltcGxlbWVudGF0aW9uIGZvciBzb21lIHRpbWUg
YW5kIGhhdmUKPiBlbmNvdW50ZXJlZCBzb21lIG9mIGl0cyBzaG9ydGNvbWluZ3MsIHdoaWNoIHRo
aXMgaW1wbGVtZW50YXRpb24gaGFzIGFsc28KPiBpbmhlcml0ZWQuCj4KPiBPbiBNb24sIEZlYiAy
MywgMjAyNiBhdCAxMDoxOToxN0FNICswNTMwLCBIaW1hbnNodSBDaGF1aGFuIHdyb3RlOgo+ID4g
Ky8qCj4gPiArICogSFcgQnJlYWtwb2ludC93YXRjaHBvaW50IGhhbmRsZXIKPiA+ICsgKi8KPiA+
ICtzdGF0aWMgaW50IGh3X2JyZWFrcG9pbnRfaGFuZGxlcihzdHJ1Y3QgZGllX2FyZ3MgKmFyZ3Mp
Cj4gPiArewo+ID4gKyAgICAgaW50IHJldCA9IE5PVElGWV9ET05FOwo+ID4gKyAgICAgc3RydWN0
IGFyY2hfaHdfYnJlYWtwb2ludCAqYnA7Cj4gPiArICAgICBzdHJ1Y3QgcGVyZl9ldmVudCAqZXZl
bnQ7Cj4gPiArICAgICBpbnQgaTsKPiA+ICsKPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBkYnRy
X3RvdGFsX251bTsgaSsrKSB7Cj4gPiArICAgICAgICAgICAgIGV2ZW50ID0gdGhpc19jcHVfcmVh
ZChwY3B1X2h3X2JwX2V2ZW50c1tpXSk7Cj4gPiArICAgICAgICAgICAgIGlmICghZXZlbnQpCj4g
PiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiArCj4gPiArICAgICAgICAgICAg
IGJwID0gY291bnRlcl9hcmNoX2JwKGV2ZW50KTsKPiA+ICsgICAgICAgICAgICAgc3dpdGNoIChi
cC0+dHlwZSkgewo+ID4gKyAgICAgICAgICAgICAvKiBCcmVha3BvaW50ICovCj4gPiArICAgICAg
ICAgICAgIGNhc2UgUlZfREJUUl9CUDoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoYnAt
PmFkZHJlc3MgPT0gYXJncy0+cmVncy0+ZXBjKSB7Cj4KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBlcmZfYnBfZXZlbnQoZXZlbnQsIGFyZ3MtPnJlZ3MpOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gTk9USUZZX1NUT1A7Cj4gPiArICAgICAgICAgICAg
ICAgICAgICAgfQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICAvKiBXYXRjaHBvaW50ICovCj4gPiArICAgICAgICAgICAgIGNhc2UgUlZfREJU
Ul9XUDoKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoYnAtPmFkZHJlc3MgPT0gY3NyX3Jl
YWQoQ1NSX1NUVkFMKSkgewo+Cj4gU2R0cmlnIHNwZWMgKDUuNy4xMSBhbmQgNS43LjEyIGluIHRo
ZSB0ZGF0YTEuc2VsZWN0IGZpZWxkIGRlc2NyaXB0aW9uKSBzdGF0ZXMgdGhhdDoKPiAiVGhlcmUg
aXMgYXQgbGVhc3QgKCEpIG9uZSBjb21wYXJlIHZhbHVlIGFuZCBpdCBjb250YWlucyB0aGUgbG93
ZXN0IHZpcnR1YWwKPiBhZGRyZXNzIG9mIHRoZSBhY2Nlc3MuIEluIGFkZGl0aW9uLCBpdCBpcyBy
ZWNvbW1lbmRlZCB0aGF0IHRoZXJlIGFyZSBhZGRpdGlvbmFsCj4gY29tcGFyZSB2YWx1ZXMgZm9y
IHRoZSBvdGhlciBhY2Nlc3NlZCB2aXJ0dWFsIGFkZHJlc3NlcyBtYXRjaC4gKEUuZy4gb24gYSAz
Mi1iaXQKPiByZWFkIGZyb20gMHg0MDAwLCB0aGUgbG93ZXN0IGFkZHJlc3MgaXMgMHg0MDAwIGFu
ZCB0aGUgb3RoZXIgYWRkcmVzc2VzIGFyZQo+IDB4NDAwMSwgMHg0MDAyLCBhbmQgMHg0MDAzIi4K
Pgo+IEEgMzItYml0IHJlYWQgZnJvbSAweDQwMDAgd2lsbCBkZWZpbml0ZWx5IGhhdmUgY29tcGFy
ZSB2YWx1ZSAweDQwMDAgKHRoZSBsb3dlc3QKPiB2aXJ0dWFsIGFkZHJlc3MpLCBidXQgbWF5IGFs
c28gaGF2ZSBjb21wYXJlIHZhbHVlcyBhdCAweDQwMDEsIDB4NDAwMiwgYW5kIDB4NDAwMy4KPiBU
aGlzIG1lYW5zIHRoYXQgYSAxNi1iaXQgd2F0Y2hwb2ludCBhdCAweDQwMDIgd2lsbCBmaXJlIG9u
IHRoaXMgMzItYml0IHJlYWQsIHlldAo+IHN0dmFsIHdpbGwgYmUgMHg0MDAwLCBhbmQgdGhlIGN1
cnJlbnQgaHdfYnJlYWtwb2ludF9oYW5kbGVyIGltcGxlbWVudGF0aW9uIHdpbGwKPiBub3QgZGV0
ZWN0IGl0Lgo+Cj4gVGhlcmVmb3JlLCBpdCBpcyBpbXBvcnRhbnQgdG8gY2hlY2sgdGRhdGExLmhp
dCBiaXQgKHdoaWNoIGluZGljYXRlcyB0aGF0IHRoZQo+IHRyaWdnZXIgY29uZGl0aW9uIHdhcyBk
ZWZpbml0ZWx5IG1ldCkgYW5kIG9ubHkgdXNlIHRoZSBjb21wYXJpc29uIGJldHdlZW4KPiBicC0+
YWRkcmVzcyBhbmQgQ1NSX1NUVkFMIGFzIGEgZmFsbGJhY2sgKGlmIHRkYXRhMS5oaXQgaXMgbm90
IHN1cHBvcnRlZCBieSB0aGUKPiBoYXJkd2FyZSkuCj4KWW91IGFyZSByaWdodC4gSSB3aWxsIGFk
ZCB0aGlzIGluIG15IG5leHQgcmV2aXNpb24uCgpUaGFua3MgJiBSZWdhcmRzCkhpbWFuc2h1Cgo+
ID4gKy8qIGF0b21pYzogY291bnRlci0+Y3R4LT5sb2NrIGlzIGhlbGQgKi8KPiA+ICtpbnQgYXJj
aF9pbnN0YWxsX2h3X2JyZWFrcG9pbnQoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50KQo+ID4gK3sK
PiA+ICsgICAgIHN0cnVjdCBhcmNoX2h3X2JyZWFrcG9pbnQgKmJwID0gY291bnRlcl9hcmNoX2Jw
KGV2ZW50KTsKPiA+ICsgICAgIHVuaW9uIHNiaV9kYnRyX3NobWVtX2VudHJ5ICpzaG1lbSA9IHRo
aXNfY3B1X3B0cihzYmlfZGJ0cl9zaG1lbSk7Cj4gPiArICAgICBzdHJ1Y3Qgc2JpX2RidHJfZGF0
YV9tc2cgKnhtaXQ7Cj4gPiArICAgICBzdHJ1Y3Qgc2JpX2RidHJfaWRfbXNnICpyZWN2Owo+ID4g
KyAgICAgc3RydWN0IHBlcmZfZXZlbnQgKipzbG90Owo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBp
ZHg7Cj4gPiArICAgICBzdHJ1Y3Qgc2JpcmV0IHJldDsKPiA+ICsgICAgIGludCBlcnIgPSAwOwo+
ID4gKwo+ID4gKyAgICAgcmF3X3NwaW5fbG9ja19pcnFzYXZlKHRoaXNfY3B1X3B0cigmZWNhbGxf
bG9jayksCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgKnRoaXNfY3B1X3B0cigmZWNh
bGxfbG9ja19mbGFncykpOwo+ID4gKwo+ID4gKyAgICAgeG1pdCA9ICZzaG1lbS0+ZGF0YTsKPiA+
ICsgICAgIHJlY3YgPSAmc2htZW0tPmlkOwo+ID4gKyAgICAgeG1pdC0+dGRhdGExID0gY3B1X3Rv
X2xlKGJwLT50ZGF0YTEpOwo+ID4gKyAgICAgeG1pdC0+dGRhdGEyID0gY3B1X3RvX2xlKGJwLT50
ZGF0YTIpOwo+ID4gKyAgICAgeG1pdC0+dGRhdGEzID0gY3B1X3RvX2xlKGJwLT50ZGF0YTMpOwo+
ID4gKwo+ID4gKyAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJUUiwgU0JJX0VYVF9EQlRS
X1RSSUdfSU5TVEFMTCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAxLCAwLCAwLCAwLCAwLCAw
KTsKPgo+IHBlcmYgaW5zdGFsbHMgYnJlYWtwb2ludHMgKHZpYSB0aGUgY2FsbCBjaGFpbiBwbXUu
YWRkLT5hcmNoX2luc3RhbGxfaHdfYnJlYWtwb2ludCkKPiBkdXJpbmcgY29udGV4dCByb3RhdGlv
biBhZnRlciBhIHBlcmZfZXZlbnRfb3BlbiBvciBwdHJhY2UgY2FsbCBmaW5pc2hlcy4KPiBTbywg
aWYgdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgdGhlIGdpdmVuIHRkYXRhMSwgdGRhdGEy
IGFuZCB0ZGF0YTMKPiBjb25maWd1cmF0aW9uIGFuZCBPcGVuU0JJIGZhaWxzIHRvIHNldCB1cCB0
aGUgdHJpZ2dlciwgdGhlIGtlcm5lbCB3aWxsIHN0aWxsCj4gcmVwb3J0IHRoYXQgdGhlIGJyZWFr
cG9pbnQgd2FzIHN1Y2Nlc3NmdWxseSBpbnN0YWxsZWQuCj4KPiBBIHByb2Jpbmcgc3RhZ2UgaXMg
dGhlcmVmb3JlIG5lZWRlZCAgYmVmb3JlIG9yIGR1cmluZyBwZXJmIGV2ZW50Cj4gcmVnaXN0cmF0
aW9uIHRvIGVuc3VyZSB0aGF0IGFsbCBicmVha3BvaW50cyBjYW4gYmUgaW5zdGFsbGVkCj4gc3Vj
Y2Vzc2Z1bGx5IGR1cmluZyBjb250ZXh0IHJvdGF0aW9uLgo+Cj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
