Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AA9CA6013
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 22:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuhscdmLnWaCX3qnjTOWgUpmwkqOpZOrBeWSf8Vfn0I=; b=ToWSAKscXo8F5N
	vqWMkMzb0uLSu0iPWhLIkNPqxfxNulyis/JpZ0/eY19HpHfEn483UN5AG/a72IP7WLAxKoMvfGvkI
	AO9VyaaE1zfJFlMwBDkJFes+/yBxPg0b6qV/tmhRbVt+DvlZdisiVkZ28F5VDwEcorwVKMXVrHivG
	Rmu/eIfJ1c6fU3Lv2Mkwa5ITZUnO452Pv1wWmuLPAyFd/uXoH2fN7eErnjXUk6ofdcjkumJatX5Vp
	jxxS3kkmboZ6lDlM+y7M0R/OVjcyNvaOoe3yMdKvsVwmStTyjG21tdtmkr5f5Mkh59w1ciryUeTT3
	MOlNOVqIAsJmJ2WSHenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx2A-000000058zw-3H8F;
	Thu, 08 Oct 2026 22:56:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEx28-000000058zZ-0FYm
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 22:56:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698L0NI43387063
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=; b=VjcnveP7FcU+lCYS
	Ba/x4qVGtl4f31sLb2fJW9V93vtlaj1jvzXL0GZ60xmRCglZHFQWydv+f95h84j/
	h0fSeuKGvt3SdUE1GRItOYaLsRjsiUrvbdBSn7yOVT7WIl9Ck2vCeK39JV/fmhgk
	f6A1PDe4cvLV97WX9v6QYldbSRF8LkehVPwDZw7QOV7uIMTOQcVL2qgFjEHmr/Ze
	GtH8y9R1W2D6VqBck9isC7qpTqpsQCeICJcUJKoJWg4UeTl3Yq7JBlhFhh3NiBDi
	OeX4nAfMv3Npv+E2OuZNmBKoDPj5E0JhZydE/n/N878MUKtq3oDL8ClFO6E0rOnk
	JMyvDg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxrrygs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 22:56:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd0869f3578so2047411a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791500174; x=1792104974; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=VLgwtuGDFeG4UEHIRRB3ZOvp4Rv0HjQ8xAQZRvG7Vn56aQhvg2K0xMp7mALQeon6/j
         6vbW1dA3E6rhGAqEwfWo9sE3OY0moR9CMtuYmObpMBbbMB8LMs7HjrQARmoGf1ojyFFv
         /sWSmWX8AlnditF9+q0WpXt1/zMm0RhHaV7HWoU95FKKpR+DURfrlk3ZuKVwvmrmfT8Q
         K1g2sSkz8pUzC+w7HTt6tT2/5TPf9+EmQth+sdnOfQYML+0Mzb4zWxgFvSMqs5EB6mNY
         j9bzeqMYAaVKgz2UO9ISgXyYQGQhPkFL/X7rOElcxhP1lSSk3OOFqBqQ4LfRZsZLjCIO
         CGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791500174; x=1792104974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1R3a3lX7xBG1rH21ZiJOz8wd4EF5DgZhVhNu/UOfns=;
        b=y/HixBsfEUKzcT00eyzJ41LdQrwNc5NS6IpBe/Et+gwhFX4dGPsYiWQIrav6ifBexi
         hijdPTVeGvhh30tiemNRVMPAu5i4Hi8vyc+nkNlPd5fGElvsdni2HWxTnK0TgL/VpfpK
         RhrnJgaeBGbPzv/3awDvqywFeXgx8aXDLiaBsoXTee7MLtTwhWNQJ579S8voK+9TIph/
         yuFAE1jgJ6escze/Q0oq7CR7ep3D+DE5V5fP5OUABjwpt26hgWRuz88DEGtX4gtZE3NU
         s3G6jgt9eoEJCmxIlvoAUrmJpQVzIpDX8AcqOScTNMPU4OrItEBXAHD/7QwKV4iAsg6q
         k+8A==
X-Forwarded-Encrypted: i=1; AKwUvBwUezqHgY2XWnEtssqPrEMA5q+t6pX2j6B0NlR8DwhdhIixz5Ga0Z4I6KfJAACw+TwL9Ve7irXojptzRQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLKVqM/xuGFRPHX1SkMki54Qpu+5O9uw7Cd4KC612mQ8PfrIZtC
	2UZUZuDInN1aU5RznwrmVxEAUZn2GPubzAKdDf3C6lqpSVvdiy1xVNg/9i/1/q49L9HKDl4Yrpa
	Fk5rp8jyAcbBVo0UYWb0halXAf44Y9+c2hXsykneqCfQm1NN3yi73W4UMIET1FTQqPf80pw==
X-Gm-Gg: AYBFou11CUuStk+QT3RjbPfE+qWfNKwCOgcWQaGArc5pfG7BDylrBbB1gmY8AgzV7oA
	NgY6fvfhtUvHhsdwPNykm7mzSEmkWQtK1+gFDeiDBdy9/78cUbopCQhOh+3+aS444qpGa/ByDfQ
	msHVI26o1GsvhO6lPyNlZIRuQeJddfaUnE7O731s1k+E/ByXo53qkeA5dhTgkjwP1pC794xVoJU
	//fv9QhvPJGc5Dga7GiTvs/nh80L8qVZ3/HUuwyHxnknSACsCONaxFWQ68IIMrPMcgW/RNXpqJ8
	erZO9n1refFqdRV9W4fjiQoGe19JSZC8gPKT0n96L97k/Z+kDHUpj+1hZyATCzI7kXV87YLRBMX
	IkRcSEswXk3aIEVtPqWIE4A6FbMubZzEF
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217307a91.51.1791500174407;
        Thu, 08 Oct 2026 15:56:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3b48:b0:3a4:dc2c:be9e with SMTP id 98e67ed59e1d1-3ab3a8d5755mr217285a91.51.1791500173870;
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Received: from [192.168.1.86] ([65.181.12.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ddac6dsm549161a91.7.2026.10.08.15.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 15:56:13 -0700 (PDT)
Message-ID: <f5682a0f-a0bf-46f2-a238-faeb1333c071@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 09:56:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 6/8] tee: optee: execute yielding RPMI calls
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-6-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <CAGgiveUzBk0Na13cqPRnQw8y2XdQ9LLktFK5eaJLTMiQZJPc_w@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac81f8f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=9v5PfQ1E2GNzj2RibJmqVw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=AUF5Mc4sii5JqdCOvnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: LJI6fhBL-KFNthV6gVrFRkgMH3-SckXW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfXxZlFqns419jp
 I1P/6VVpy+NXostw/ED6ZKLG2Dloa9KDaqgJstVWBAzbGq9aaO+9yVjgCZUhjplHjZb6Qya3lFg
 GvOESywsiM2t0gPBRftMmA+e958OoEWE+EEzkvNS8NiChLiJVzpM8xtrq8qHMtX9ghp4/P3139Z
 pPeQyHG3oti1KoLeBr+rz2Y3ilqgIzZHEFkx2OJw2bO48s7vlo495aVhQZgiYTK0viEojJQmjc2
 8ff8oxS3EGp/T0/o8tyWVZlXjBCugE+rp1xCWLZ+vPzm1BLPF/hEWMLNxr+3LFfiwfHBLAdFZcz
 eKLHBKOsagjgmzWR8DgDXrargWImRejx5Vjwjzc0TbeaKLHJA2RtDNUUTtMoryT4nERNi+h5q9v
 JhmHw9qPpyO4CUF9ZPJ/2uvp75z9ICpLQc4nkzxhnIhO1IWuOMnlnDBxIl21AVo+sTylUitrVlF
 ts0mJer+I0q2DsU9waA==
X-Proofpoint-ORIG-GUID: LJI6fhBL-KFNthV6gVrFRkgMH3-SckXW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA5MSBTYWx0ZWRfX9IWweycYxFce
 vyFe1SiQq5k6PaV33GE+G+GrZUeFIPN+zkC4BMOA+k5we4nMNWyofigUXobEfsvXFCSoiHGwFE4
 loPMMI1VuAYApMtGhXP3vgdjYYhvdbs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_07,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_155616_112553_46860E41 
X-CRM114-Status: GOOD (  30.26  )
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

SGkgSmVucywKCk9uIDEwLzgvMjAyNiA3OjExIFBNLCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiBP
biBUdWUsIE9jdCA2LCAyMDI2IGF0IDI6NDDigK9BTSBBbWlycmV6YSBaYXJyYWJpCj4gPGFtaXJy
ZXphLnphcnJhYmlAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4+Cj4+IE9QLVRFRSBjb21tYW5k
cyBjYW4gc3BhbiBtdWx0aXBsZSBleGNoYW5nZXMgd2l0aCBub3JtYWwgd29ybGQuIEEgY2FsbAo+
PiBtYXkgeWllbGQgdG8gcmVxdWVzdCBhbiBSUEMgc2VydmljZSBvciBhbGxvdyBpbnRlcnJ1cHQg
cHJvY2Vzc2luZwo+PiBiZWZvcmUgY29udGludWluZyBleGVjdXRpb24gaW4gc2VjdXJlIHdvcmxk
Lgo+Pgo+PiBBZGQgdGhlIFJQTUkgeWllbGRpbmctY2FsbCBwYXRoIHVzZWQgYnkgdGhlIGNvbW1v
biBPUC1URUUgc2Vzc2lvbgo+PiBvcGVyYXRpb25zLiBTdWJtaXQgdGhlIGNvbW1hbmQgYW5kIFJQ
QyBhcmd1bWVudCBidWZmZXJzIGFzIHJhbmdlcwo+PiB3aXRoaW4gYSBzaGFyZWQgbWVtb3J5IHBh
cmNlbC4KPj4KPj4gSGFuZGxlIFJQQyByZXF1ZXN0cyB3aGlsZSB0aGUgY2FsbCBpcyBzdXNwZW5k
ZWQgYW5kIHJlc3VtZSBleGVjdXRpb24KPj4gdXNpbmcgdGhlIHRva2VuIHJldHVybmVkIGJ5IE9Q
LVRFRSB1bnRpbCB0aGUgY29tbWFuZCBjb21wbGV0ZXMuCj4+Cj4+IFVzZSB0aGUgY29tbW9uIE9Q
LVRFRSBjYWxsIHF1ZXVlIHRvIHdhaXQgd2hlbiBhbiBpbml0aWFsIHJlcXVlc3QgaXMKPj4gcmVq
ZWN0ZWQgd2l0aCBSUE1JX0VSUl9CVVNZLCBhbGxvd2luZyBhbm90aGVyIGFjdGl2ZSBjYWxsIHRv
IGNvbXBsZXRlCj4+IGJlZm9yZSByZXRyeWluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW1pcnJl
emEgWmFycmFiaSA8YW1pcnJlemEuemFycmFiaUBvc3MucXVhbGNvbW0uY29tPgo+PiAtLS0KPj4g
IGRyaXZlcnMvdGVlL29wdGVlL3JwbWlfYWJpLmMgfCAxMjQgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDEyNCBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3RlZS9vcHRlZS9ycG1pX2FiaS5jIGIvZHJp
dmVycy90ZWUvb3B0ZWUvcnBtaV9hYmkuYwo+PiBpbmRleCA1OGQ4MjY3OGJlOTguLjZlNzYzMTY3
OTRjMSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy90ZWUvb3B0ZWUvcnBtaV9hYmkuYwo+PiArKysg
Yi9kcml2ZXJzL3RlZS9vcHRlZS9ycG1pX2FiaS5jCj4+IEBAIC05LDYgKzksNyBAQAo+PiAgI2lu
Y2x1ZGUgPGxpbnV4L21haWxib3gvcmlzY3YtcnBtaS1tZXNzYWdlLmg+Cj4+ICAjaW5jbHVkZSA8
bGludXgvb3ZlcmZsb3cuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9ycG1pX3RlZS5oPgo+PiArI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+PiAgI2lu
Y2x1ZGUgPGxpbnV4L3VuYWxpZ25lZC5oPgo+PiAgI2luY2x1ZGUgIm9wdGVlX3ByaXZhdGUuaCIK
Pj4gQEAgLTU2MCwzICs1NjEsMTI2IEBAIHN0YXRpYyB2b2lkIG9wdGVlX3JwbWlfaGFuZGxlX3Jw
Y19jbWQoc3RydWN0IHRlZV9jb250ZXh0ICpjdHgsCj4+ICAgICAgICAgICAgICAgICBvcHRlZV9y
cGNfY21kKGN0eCwgb3B0ZWUsIGFyZyk7Cj4+ICAgICAgICAgfQo+PiAgfQo+PiArCj4+ICsvKiBI
YW5kbGUgUlBDIGNvbW1hbmQgb3IgaW50ZXJydXB0IHJldHVybnMgZnJvbSBhIHlpZWxkaW5nIGNh
bGwuICovCj4+ICtzdGF0aWMgdm9pZCBvcHRlZV9ycG1pX2hhbmRsZV9ycGMoc3RydWN0IHRlZV9j
b250ZXh0ICpjdHgsIHN0cnVjdCBvcHRlZSAqb3B0ZWUsCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1MzIgcmVzdWx0LCBzdHJ1Y3Qgb3B0ZWVfbXNnX2FyZyAqYXJnKQo+PiAr
ewo+PiArICAgICAgIHN3aXRjaCAocmVzdWx0KSB7Cj4+ICsgICAgICAgY2FzZSBPUFRFRV9SUE1J
X1lJRUxESU5HX0NBTExfUkVUVVJOX1JQQ19DTUQ6Cj4+ICsgICAgICAgICAgICAgICBvcHRlZV9y
cG1pX2hhbmRsZV9ycGNfY21kKGN0eCwgb3B0ZWUsIGFyZyk7Cj4+ICsgICAgICAgICAgICAgICBi
cmVhazsKPj4gKyAgICAgICBjYXNlIE9QVEVFX1JQTUlfWUlFTERJTkdfQ0FMTF9SRVRVUk5fSU5U
RVJSVVBUOgo+PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4+ICsgICAgICAgZGVmYXVsdDoKPj4g
KyAgICAgICAgICAgICAgIHByX3dhcm4oIlVua25vd24gUlBDIGZ1bmMgMHgleFxuIiwgcmVzdWx0
KTsKPj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgIH0KPj4gK30KPj4gKwo+PiAr
LyoqCj4+ICsgKiBvcHRlZV9ycG1pX3lpZWxkaW5nX2NhbGwoKSAtIHN1Ym1pdCBhbmQgcmVzdW1l
IGEgeWllbGRpbmcgUlBNSSBjb21tYW5kCj4+ICsgKiBAY3R4OiBjYWxsaW5nIGNvbnRleHQKPj4g
KyAqIEByZXE6IGluaXRpYWwgY29tbWFuZCByZXF1ZXN0Cj4+ICsgKiBAcnBjX2FyZzogc2hhcmVk
IFJQQyBhcmd1bWVudCBidWZmZXIKPj4gKyAqIEBzeXN0ZW1fdGhyZWFkOiBjYWxsZXIgcmVxdWVz
dHMgVEVFIHN5c3RlbSB0aHJlYWQgc3VwcG9ydAo+PiArICoKPj4gKyAqIE9ubHkgUlBNSV9FUlJf
QlVTWSByZWplY3Rpb24gb2YgdGhlIGluaXRpYWwgY29tbWFuZCBwZXJtaXRzIHJldHJ5Lgo+PiAr
ICoKPj4gKyAqIFJldHVybjogemVybyBvbiBjb21wbGV0aW9uLCBvciBhIG5lZ2F0aXZlIGVycm9y
Lgo+PiArICovCj4+ICtzdGF0aWMgaW50IG9wdGVlX3JwbWlfeWllbGRpbmdfY2FsbChzdHJ1Y3Qg
dGVlX2NvbnRleHQgKmN0eCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RydWN0IG9wdGVlX3JwbWlfY2FsbF9yZXEgKnJlcSwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG9wdGVlX21zZ19hcmcgKnJwY19hcmcsCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgc3lzdGVtX3RocmVhZCkKPj4g
K3sKPj4gKyAgICAgICBzdHJ1Y3Qgb3B0ZWUgKm9wdGVlID0gdGVlX2dldF9kcnZkYXRhKGN0eC0+
dGVlZGV2KTsKPj4gKyAgICAgICBzdHJ1Y3Qgb3B0ZWVfcnBtaV9yZXN1bWVfcmVxIHJlc3VtZSA9
IHsKPj4gKyAgICAgICAgICAgICAgIC5vcCA9IGNwdV90b19sZTMyKE9QVEVFX1JQTUlfWUlFTERJ
TkdfQ0FMTF9SRVNVTUUpLAo+PiArICAgICAgICAgICAgICAgLyogcmVzdW1lX3Rva2VuIGlzIG5v
bnplcm8gYWZ0ZXIgT1AtVEVFIHN1c3BlbmRzIHRoZSBjYWxsLiAqLwo+PiArICAgICAgICAgICAg
ICAgLnJlc3VtZV90b2tlbiA9IDAsCj4gCj4gSSBtaXNzZWQgdGhpcyB3aGVuIHJldmlld2luZyAi
dGVlOiBvcHRlZTogZGVmaW5lIHRoZSBSUE1JIGNvbnRyb2wgYW5kCj4gcGFyY2VsLXJlZmVyZW5j
ZSBBQkkiLiBJJ2QgcHJlZmVyIGlmIHRoZSByZXN1bWVfdG9rZW4gd2FzIGEgdHJ1bHkKPiBvcGFx
dWUgdmFsdWUsIGp1c3QgYXMgZm9yIHRoZSBTTUMgYW5kIEZGLUEgQUJJcy4gQW55IHJlYXNvbiB3
aHkgaXQncyBhCj4gNjQtYml0IHZhbHVlIGluc3RlYWQgb2YgMzItYml0LCBhcyBpcyB1c2VkIGZv
ciB0aGUgb3RoZXIgQUJJPwo+IAoKQWdyZWVkLiBJIGN1cnJlbnRseSB1c2UgYSB6ZXJvIHRva2Vu
IHRvIGRpc3Rpbmd1aXNoIHRoZSBpbml0aWFsIHJlcXVlc3QKZnJvbSBhIHJlc3VtZS4gSSdsbCB0
cmFjayB0aGF0IHNlcGFyYXRlbHkgd2l0aCBhIGJvb2xlYW4gYW5kIHRyZWF0IHRoZSB0b2tlbgph
cyBvcGFxdWUsIG9ubHkgY29weWluZyBpdCBmcm9tIHRoZSByZXNwb25zZSBpbnRvIHRoZSByZXN1
bWUgcmVxdWVzdC4KClRoZXJlIGlzIG5vIHNwZWNpZmljIHJlYXNvbiBmb3IgaXQgdG8gYmUgNjQt
Yml0OyBJIG92ZXJsb29rZWQgdGhlCmV4aXN0aW5nIEFCSSBjb252ZW50aW9uLiBJJ2xsIGNoYW5n
ZSBpdCB0byAzMi1iaXQuCgo+PiArICAgICAgIH07Cj4+ICsgICAgICAgc3RydWN0IG9wdGVlX3Jw
bWlfY2FsbF9yZXNwIHJlc3A7Cj4+ICsgICAgICAgc3RydWN0IG9wdGVlX2NhbGxfd2FpdGVyIHdh
aXRlcjsKPj4gKyAgICAgICB1MzIgcmVzdWx0Owo+PiArICAgICAgIHMzMiBzdGF0dXM7Cj4+ICsg
ICAgICAgaW50IHJldDsKPj4gKwo+PiArICAgICAgIG9wdGVlX2NxX3dhaXRfaW5pdCgmb3B0ZWUt
PmNhbGxfcXVldWUsICZ3YWl0ZXIsIHN5c3RlbV90aHJlYWQpOwo+PiArICAgICAgIHdoaWxlICh0
cnVlKSB7Cj4+ICsgICAgICAgICAgICAgICBpZiAocmVzdW1lLnJlc3VtZV90b2tlbikKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0ID0gb3B0ZWVfcnBtaV9jYWxsX3dpdGhfc3RhdHVzKG9w
dGVlLCAmcmVzdW1lLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKHJlc3VtZSksICZyZXNwLAo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHJlc3Ap
LCAmc3RhdHVzKTsKPj4gKyAgICAgICAgICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0ID0gb3B0ZWVfcnBtaV9jYWxsX3dpdGhfc3RhdHVzKG9wdGVlLCByZXEsIHNpemVv
ZigqcmVxKSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZyZXNwLCBzaXplb2YocmVzcCksCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3RhdHVzKTsKPiAKPiBQbGVh
c2UgZml4IHRoZSB0b28tbG9uZyBsaW5lcyBhYm92ZS4KPiAKCkFjay4KCj4+ICsgICAgICAgICAg
ICAgICBpZiAocmV0KQo+PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4+ICsK
Pj4gKyAgICAgICAgICAgICAgIHN3aXRjaCAoc3RhdHVzKSB7Cj4+ICsgICAgICAgICAgICAgICBj
YXNlIFJQTUlfU1VDQ0VTUzoKPiAKPiBBbnkgcGFydGljdWxhciByZWFzb24gd2h5IHdlIGFyZW4n
dCB1c2luZyBURUUgZXJyb3IgY29kZXMgaGVyZT8KPiAKCkkgZGVmaW5lZCBSUE1JIGVycm9yIGNv
ZGVzIGNvbnNpc3RlbnRseSBmb3IgYWxsIGNvbnRyb2wgcmVzcG9uc2VzIGluIG9wdGVlX3JwbWku
aC4KSG93ZXZlciwgdGhlc2Ugc3RhdHVzZXMgYmVsb25nIHRvIHRoZSBPUC1URUUgc2VydmljZSBB
QkkgcmF0aGVyIHRoYW4gdGhlIHRyYW5zcG9ydC4KSSdsbCBjaGFuZ2UgdGhlbSB0byBURUUgZXJy
b3IgY29kZXMgYW5kIGtlZXAgUlBNSSBlcnJvcnMgYXQgdGhlIHRyYW5zcG9ydCBsYXllci4KCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAgICAgICAgICAgY2FzZSBS
UE1JX0VSUl9CVVNZOgo+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIXJlc3VtZS5yZXN1
bWVfdG9rZW4pIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRlZV9jcV93
YWl0X2Zvcl9jb21wbGV0aW9uKCZvcHRlZS0+Y2FsbF9xdWV1ZSwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ3YWl0ZXIpOwo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+PiArICAgICAgICAg
ICAgICAgICAgICAgICB9Cj4+ICsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmFsbHRocm91
Z2g7Cj4+ICsgICAgICAgICAgICAgICBkZWZhdWx0Ogo+PiArICAgICAgICAgICAgICAgICAgICAg
ICByZXQgPSBycG1pX3RvX2xpbnV4X2Vycm9yKHN0YXR1cyk7Cj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gZG9uZTsKPj4gKyAgICAgICAgICAgICAgIH0KPj4gKwo+PiArICAgICAgICAg
ICAgICAgcmVzdWx0ID0gZ2V0X3VuYWxpZ25lZF9sZTMyKCZyZXNwLnJlc3VsdCk7Cj4gCj4gV2h5
IG5vdCBsZTMyX3RvX2NwdShyZXNwLnJlc3VsdCk/CgpZb3UgYXJlIHJpZ2h0LCB0aGVyZSBhcmUg
YSBjb3VwbGUgb2YgbW9yZSBvZiB0aGlzIHRoYXQgSSBtaXNzZWQuCkknbGwgZml4IGFsbCBpbiB0
aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtzIEplbnMgZm9yIHRoZSByZXZpZXcuCgpCZXN0IFJlZ2Fy
ZHMsCkFtaXIKCj4gCj4gQ2hlZXJzLAo+IEplbnMKPiAKPj4gKyAgICAgICAgICAgICAgIGlmIChy
ZXN1bHQgPT0gT1BURUVfUlBNSV9ZSUVMRElOR19DQUxMX1JFVFVSTl9ET05FKQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIGNvbmRf
cmVzY2hlZCgpOwo+PiArICAgICAgICAgICAgICAgb3B0ZWVfcnBtaV9oYW5kbGVfcnBjKGN0eCwg
b3B0ZWUsIHJlc3VsdCwgcnBjX2FyZyk7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIHJlc3VtZS5y
ZXN1bWVfdG9rZW4gPSByZXNwLnJlc3VtZV90b2tlbjsKPj4gKyAgICAgICB9Cj4+ICtkb25lOgo+
PiArICAgICAgIG9wdGVlX2NxX3dhaXRfZmluYWwoJm9wdGVlLT5jYWxsX3F1ZXVlLCAmd2FpdGVy
KTsKPj4gKwo+PiArICAgICAgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4gKy8qIFRoZSBjYWxs
ZXIgc3VwcGxpZXMgU0hNIHdpdGggcm9vbSBmb3IgY29tbWFuZCBhbmQgUlBDIGFyZ3MuICovCj4+
ICtzdGF0aWMgaW50IG9wdGVlX3JwbWlfZG9fY2FsbF93aXRoX2FyZyhzdHJ1Y3QgdGVlX2NvbnRl
eHQgKmN0eCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHRlZV9zaG0gKnNobSwgdV9pbnQgb2ZmcywKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgYm9vbCBzeXN0ZW1fdGhyZWFkKQo+PiArewo+PiArICAgICAgIHN0cnVjdCBv
cHRlZSAqb3B0ZWUgPSB0ZWVfZ2V0X2RydmRhdGEoY3R4LT50ZWVkZXYpOwo+PiArICAgICAgIHN0
cnVjdCBvcHRlZV9tc2dfYXJnICphcmcsICpycGNfYXJnOwo+PiArICAgICAgIHN0cnVjdCBvcHRl
ZV9ycG1pX2NhbGxfcmVxIHJlcTsKPj4gKyAgICAgICBzaXplX3QgYXJnX3NpemUsIHJwY19zaXpl
LCBycGNfb2Zmc2V0Owo+PiArICAgICAgIHUzMiBwYXJjZWxfaWQsIG5vbmNlOwo+PiArCj4+ICsg
ICAgICAgYXJnID0gdGVlX3NobV9nZXRfdmEoc2htLCBvZmZzKTsKPj4gKyAgICAgICBpZiAoSVNf
RVJSKGFyZykpCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihhcmcpOwo+PiArCj4+
ICsgICAgICAgYXJnX3NpemUgPSBPUFRFRV9NU0dfR0VUX0FSR19TSVpFKGFyZy0+bnVtX3BhcmFt
cyk7Cj4+ICsgICAgICAgcnBjX3NpemUgPSBPUFRFRV9NU0dfR0VUX0FSR19TSVpFKG9wdGVlLT5y
cGNfcGFyYW1fY291bnQpOwo+PiArICAgICAgIHJwY19vZmZzZXQgPSBvZmZzICsgYXJnX3NpemU7
Cj4+ICsgICAgICAgcnBjX2FyZyA9IHRlZV9zaG1fZ2V0X3ZhKHNobSwgcnBjX29mZnNldCk7Cj4+
ICsgICAgICAgaWYgKElTX0VSUihycGNfYXJnKSkKPj4gKyAgICAgICAgICAgICAgIHJldHVybiBQ
VFJfRVJSKHJwY19hcmcpOwo+PiArCj4+ICsgICAgICAgb3B0ZWVfcnBtaV9zaG1fZ2V0X2lkZW50
aXR5KHNobSwgJnBhcmNlbF9pZCwgJm5vbmNlKTsKPj4gKwo+PiArICAgICAgIHJlcS5vcCA9IGNw
dV90b19sZTMyKE9QVEVFX1JQTUlfWUlFTERJTkdfQ0FMTF9XSVRIX0FSRyk7Cj4+ICsgICAgICAg
cmVxLnBhcmNlbF9pZCA9IGNwdV90b19sZTMyKHBhcmNlbF9pZCk7Cj4+ICsgICAgICAgcmVxLm5v
bmNlID0gY3B1X3RvX2xlMzIobm9uY2UpOwo+PiArICAgICAgIHJlcS5hcmdfb2Zmc2V0ID0gY3B1
X3RvX2xlNjQoKHU2NClzaG0tPm9mZnNldCArIG9mZnMpOwo+PiArICAgICAgIHJlcS5ycGNfb2Zm
c2V0ID0gY3B1X3RvX2xlNjQoKHU2NClzaG0tPm9mZnNldCArIHJwY19vZmZzZXQpOwo+PiArICAg
ICAgIHJlcS5hcmdfc2l6ZSA9IGNwdV90b19sZTMyKGFyZ19zaXplKTsKPj4gKyAgICAgICByZXEu
cnBjX3NpemUgPSBjcHVfdG9fbGUzMihycGNfc2l6ZSk7Cj4+ICsKPj4gKyAgICAgICByZXR1cm4g
b3B0ZWVfcnBtaV95aWVsZGluZ19jYWxsKGN0eCwgJnJlcSwgcnBjX2FyZywgc3lzdGVtX3RocmVh
ZCk7Cj4+ICt9Cj4+Cj4+IC0tCj4+IDIuMzQuMQo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
