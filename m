Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F7ECD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxCDHYpFLSzqITmC+vi8EYTT206s7Ev94qJTZ9gI654=; b=bLP9dz0gQAFmuv
	qcrHFKacOMGSGRo84u/bfQsqj6naaG3FuDjUxhKbdWt6FuvbnstbXFdUdyPyVs2AkNu6GYM1Ok3Rl
	jGo6hqhM6WuENPXvvn2M2USnM1KVhiJXgo9KRb6FWSkBHdMaUVTp5C1ivLRJ5AO+tmAJXu2seiLt1
	dpgvWdTpijRCpl3tXX+5YL9W7M+Z4JY7hDw+H9c8mYK6GoMk5C6WDf/lx4jGvU71mwjax7nzpTily
	1FP3uD/flF3ExwuBscU39Te+FAN4E3O7vw6NWJa7CNk6++EmFuNi9Ot+35K4LFbyjVQRYiiOCqgzF
	Sz1kNqivaB1B6qDwn8zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWroA-0000000545K-0E8K;
	Tue, 09 Jun 2026 08:27:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWro8-0000000544p-0jy4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 08:27:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rs3I2001613
	for <linux-riscv@lists.infradead.org>; Tue, 9 Jun 2026 08:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=TFkSAnnuzu4vpgPtCevU9biue3ziTEZcQbHKJrTFV8s=; b=a9
	+ay0tNlJqbfko3akJd6ZxVnaymemUIb0U4vMaEBJicsXy3mKJoGs4l9LMFjwToas
	Ojj+KBqwFXM0pWv2Z/iXLzdwRNb1/8tZv1AzHBofi5WkV0a9WQWg9u6oc5yAvspm
	S3Ie84Q1u7WKdC7oRtNE4tTvTabbfG3i3Kdxv1IH/KxuRbJSqQ5PPfOFmISACeVt
	Ro//6yjwkHHPgyWNQcJKzVSqGuX1CorJ82ERYhwgBJZtuycC7QT4QAPAJ5tiqjQY
	/BAW39z9JHJ8s+kZOnEy3P+UypuFrtR3/ZP/k5EDax/A4OXikUiXhFgI66oZJ4kb
	8pBNoBGn22Lb+NeK2OpA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rbwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 08:27:35 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-660313cb3a3so2522076d50.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 01:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780993655; cv=none;
        d=google.com; s=arc-20240605;
        b=Bmil3j/4Npna1k/1V1fr5B2+/zqCO26Vf94K2KNYypPgLHaqFKBoI2p0GEHuzDEtDU
         n7dVGcnC4+azkm/t68igTfq9/1Kp7mmtJiHQZrNie/QZ+bTrUgh8QGmq9xfiZbSOv5Y8
         bs7ijBtKfNrgR08EU+JoqbpbXgs54TPC4R/AfUod7gDJ9QtygGcqtMsRLn1CgsLBlr92
         kkoQb8qQxOA2KaiHu4qlrZPRzsjrsJWRi0Q9VZKYIHPGNMrxPIab8ia9sqKJaaghe0lV
         kHH41WlZUhnJst5xV7Zupdj4jamjMVxxfG1WA6C8pw9vD6q3sm3ucyybvzipy5zgX6y8
         Nb5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=TFkSAnnuzu4vpgPtCevU9biue3ziTEZcQbHKJrTFV8s=;
        fh=JPBs0T0mqs7AduWVQZ+nKlQm2WT+U42QM4etRF6cFkc=;
        b=C7Cfz3Ubr0uqInwCYZwJB+azWMyeSrfS45+jStO4nd5sz2L4PkCUZDFWuWBq65e16g
         zPSKYVRmx0yXWdNutdr/CIjUyq9sTd+9QzNR5I5P6zZfR6uLwI5VNFKPYVKNPlDyl28H
         0VDY9PRPo6KYmV8uYhrT8QIeMeXCm/d5flORN83uUHx+vJRmc7RqTcJ8hzMhRXy1Pse7
         wdPO76Sujdy+F9dLNVmSIho1RFelbvRIvJrMTmIPiGe8oaV83NlkGSoK1AEQMS/X28L7
         FeUKnPfD4SFgitmCOSUL94u+ZnkcwUSsmJExXiOEY1Tt0VbTuY7wa/ZSREvImrbftL9a
         2X3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780993655; x=1781598455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TFkSAnnuzu4vpgPtCevU9biue3ziTEZcQbHKJrTFV8s=;
        b=XkVcb4Mle1XAzrAcWSIXWVyEG3an/chkLXGpEaeofHwk3VlJqKacPDJrVNIwr3Xa/b
         98dSziTowwAf+wUD7SUIxY7bUMO94KeN407pgreaD2Id6TI+BhjWRzekabZmvL1mpUSk
         u6IBVfwsvwJOOIxRI/p3SfRfsjchnzatzwUkYkuGT3+HV2jvgqx1lGDWgAvqSfBX3OEA
         6FKtcXm1CncIWbTnrHWt+/YInI0MHue5tcDa8NTdwjygAQeTq8Fzyh2HMhuQ8tPqOnwY
         +lCBEYWt/lyb3YV6j5ruMJIamAG9kYxHR5OTr2kdXmJ8xGyrVKq5Vjc0Z49eNnypTxNT
         pfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993655; x=1781598455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFkSAnnuzu4vpgPtCevU9biue3ziTEZcQbHKJrTFV8s=;
        b=fhl7WLW9lOqwbYyaR4KL333Bqmq+uhhOS53aSpW6GfX+xs0JiqOWKaGng/0/mVBD9A
         SZ4Dg0NEsHF1gIcPPbVOg2Z/qH+i/ecP8SIVTrXuaDI1o4RD54t44LbDazSAP7PeXMuZ
         cFumCbj/OfotzO6Mt+LzFLwHyxZ9UDpKi2dGUncwyvwoTS3dSzSK5UnuBgBHJlU14qqf
         fdFtKwqf4aXiesBdmUVgH/3dK8Jv/EMxnF1ufintmrrdw04RCK8doR+yfCSuOQe2ev20
         dZKJruU4AjmKbOFKt69+U8Iggchok18ffQKb3uk2WWk8JbPZj/5LtKYX54ySE4wvs2uz
         qHfg==
X-Gm-Message-State: AOJu0YzCEywpINMDBIAZj2rbz4hUfhn25E9qZgI27UM0RoB079yWjTgw
	Dp/AluEasjUvf+id0hJjk0acQG594TDdbnD3V5GLbSK+nJfe8g5ZwHmdzRoL+zzon0qKEwIaG6k
	UkjEe1ZAn7zGJUv/nOZqTd6ayCtASOHi2Saa0N42463LGJx8UsNas8hMKEy8LjIHuEnGJbNH7ty
	BTaJAJG621k+Vxnts6bIG5TMstj6iK0w8FRBO8n0RC/oAHYA==
X-Gm-Gg: Acq92OEnrBI/GE/00KlZosQOQ8N+JlhNFNMLNsQtAV0uuqV4n/ink+hNP0sNLA4SQFc
	C2y2XRoBIA2eitsGPUlbeYtY6Kfz6/y0kLa9+4DHMLswc/SZRm49E9VNKZCKQt5jCb3CaCTAMM/
	kD6L0sX3bzviff6IBzgWYRsseO2bTyxBM2NN/vHUFPt6JWoXnhaMpIABNXVdp5OWOr/vtWQCt66
	PWXeAZiyJ1JwtmFsw==
X-Received: by 2002:a05:690e:168f:b0:660:ea4a:153a with SMTP id 956f58d0204a3-66106f4d882mr16311111d50.22.1780993654673;
        Tue, 09 Jun 2026 01:27:34 -0700 (PDT)
X-Received: by 2002:a05:690e:168f:b0:660:ea4a:153a with SMTP id
 956f58d0204a3-66106f4d882mr16311086d50.22.1780993654159; Tue, 09 Jun 2026
 01:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260513084325.2176952-1-himanshu.chauhan@oss.qualcomm.com> <20260513084325.2176952-8-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260513084325.2176952-8-himanshu.chauhan@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 13:57:23 +0530
X-Gm-Features: AVVi8CfQL2ndPqpNPolnsL7-JCyoUBHFD0_-DueGPSQTd6Hneha3xqLb-1My64o
Message-ID: <CAB19ukHDB6viGCM7FURuqsR_4E=bb8nd-z-Y32+mgrdBT7JB-A@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] riscv: Add RISC-V entries in processor type and
 ISA strings
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com,
        anup.patel@oss.qualcomm.com
X-Proofpoint-ORIG-GUID: SVpyKvAUXQD2Uufo3HIWuwVJsnOMmQGU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3OCBTYWx0ZWRfX69j8ZWDsGKSx
 RpsrlT4ay+oQdu6vW9jsLtGei61DY/5KshHORmKzUPYizvz9K2W2DOEP699KFXw2xRlK1AukmOt
 EmqqonS/WNMbOUhwJDVSjRZmyXyJW86SDNS533mI2grlL9iH+2boTjDipAfIZSKZNQCjGiZ+tqk
 x70j2L+z4y8o6Dej/na0k6vBRaAStBtpkzcdFe0H+9z8uZCmFV5X7UtGEElwtOxZz+XvokTPRvi
 JkBI7yWBrllYd5WqfaXR1JsnqAYg9kimdp4DFlq5qcrGeZU3IRZ5tqwFLH/5XQTytppD9UsUpQj
 vhiSEJNcjvXkn/kzj47yh8xkq0rUu1Q6ERDx6c/DfmTmUpum5CNWsC94nDiGhTEdjNsSyyVzZjI
 +tVm3c53xJNprOT6KQlJLzjV0R6Ir61S+5LbBipDJ0j+GoP9eaTJOR4fcqApXlB5Os5szZFx8jc
 bnWjCgiEV2P1aNU2G3g==
X-Proofpoint-GUID: SVpyKvAUXQD2Uufo3HIWuwVJsnOMmQGU
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27ce77 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=_3BUxsq8Yho0MmvbAbQA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_012736_356296_C9BA2F96 
X-CRM114-Status: GOOD (  16.33  )
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
Reply-To: sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMjoxNOKAr1BNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBZGQgUklTQ1YgYW5kIFJJ
U0NWMzIvNjQgc3RyaW5ncyBpbiB0aGUgaW4gcHJvY2Vzc29yIHR5cGUgYW5kIElTQSBzdHJpbmdz
Cj4gcmVzcGVjdGl2ZWx5LiBUaGVzZSBhcmUgZGVmaW5lZCBmb3IgY3BlciByZWNvcmRzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSGltYW5zaHUgQ2hhdWhhbiA8aGltYW5zaHUuY2hhdWhhbkBvc3MucXVh
bGNvbW0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2Zpcm13YXJlL2VmaS9jcGVyLmMgfCAzICsrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9maXJtd2FyZS9lZmkvY3Blci5jIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvY3Blci5jCj4gaW5k
ZXggMDZiNGZkYjU5OTE3Li4xYjFhYjJmMTM1NWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9maXJt
d2FyZS9lZmkvY3Blci5jCj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9lZmkvY3Blci5jCj4gQEAg
LTE3MCw2ICsxNzAsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHByb2NfdHlwZV9zdHJz
W10gPSB7Cj4gICAgICAgICAiSUEzMi9YNjQiLAo+ICAgICAgICAgIklBNjQiLAo+ICAgICAgICAg
IkFSTSIsCj4gKyAgICAgICAiUklTQy1WIiwKPiAgfTsKPgo+ICBzdGF0aWMgY29uc3QgY2hhciAq
IGNvbnN0IHByb2NfaXNhX3N0cnNbXSA9IHsKPiBAQCAtMTc4LDYgKzE3OSw4IEBAIHN0YXRpYyBj
b25zdCBjaGFyICogY29uc3QgcHJvY19pc2Ffc3Ryc1tdID0gewo+ICAgICAgICAgIlg2NCIsCj4g
ICAgICAgICAiQVJNIEEzMi9UMzIiLAo+ICAgICAgICAgIkFSTSBBNjQiLAo+ICsgICAgICAgIlJW
MzIvUlYzMkUiLAo+ICsgICAgICAgIlJWNjQiLAo+ICB9Owo+ClJldmlld2VkLWJ5OiBTdW5pbCBW
IEwgPHN1bmlsdmxAb3NzLnF1YWxjb21tLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
