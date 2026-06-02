Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C2ACD6E57
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xeZnaS0WObB/mCUXZB1Wz2BOtvz72TH2CtjEfSMQk70=; b=DFaUsFBpUwbs9p
	zSZ40nCKv31HU0ggdJnYZicQo+V82d1Akc//dIV9EOUngUZhFwzbiPEtKhhj8aRCLy4LQB43tgpDF
	dODX2mRHuBXsVsTNIW9qStuBwqs2Go/ro1NVzyWKtLEanD9ijQHkjXWGoJomsVLOYz8hiPYJ8yiKi
	aF349pVO0NQ+SoIHaLzJMOZ3pG+GakDbuNpV1KnDt3RTksKYFG8Kkk6656SMTTB0AZ2VKV72JYw0z
	B+8fIg77vMUaazw+x8IpGjrUyx6Org7ccvgYNneSIm2lykrgmccDhJS+xEY7hLy+m1F+hqKRH9Al4
	vr1cdC6cau8JZTsCJ2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNEs-0000000CrxX-40xg;
	Tue, 02 Jun 2026 11:24:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNEq-0000000Crww-2o4F
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 11:24:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6525thBn1854896
	for <linux-riscv@lists.infradead.org>; Tue, 2 Jun 2026 11:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=; b=dOfuHPa9U7us0FPo
	hDKKLj1quA3qtn//AnmVsWfiEgVtBQ4khww8vv/PiH+m6QJin19didMr0jFMH+XX
	SnPyRfwNpymh42ZYvonA6IF047hyQm5K89i4pfywALh/vF+cQFEsLxxq+6bJO16Z
	WYOOOXIufx4mcb+P95srL/dBOJfJ2A7V96Oww2hAgQv5SFMODFyz8en6DfEn+m5E
	0jdlFVONn11tOSUla0ltzdhJB2DRAcgyNsQKVrwFfgXG6jHOdJMlj3rojCoOF8zO
	eMZeEAKn/84XcvlqkE/sBgTG9rriGuPyoTFa1X3NsAiVrYMyvIL66mfAkHweH52b
	18r+gQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf798jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 11:24:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91579011fd1so174071485a.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 04:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780399490; cv=none;
        d=google.com; s=arc-20240605;
        b=hL084H+XkyKKcsB0dBW+70G0YLzdFLSfirgN50ejNvVWUL4A51B4dzqBz8PjJ+CiTk
         rJcYXUf0St0hQjzLfTJraLsSLz30HLRnYX0k6WxywvRp/C79xRuavW0mn+fJoNa3r6/e
         e+FjMswdcvGceufM3kPVlok2P+5wW8Tv71Ov4NHzg8nesLxDSQXdO6r2AZ8Luoz6RJZ2
         XRqEnK38QKtjpuzyae1a2WYVwYyv3UE0FtgVHGhTM8ykwyJOpaMox8mmhGjU+CIZVWfZ
         6JwblDNNpNQBMJfFCE9uSkBninF9D99noY4uWFEktBGyq30R0W84jnGQjDP3mcZsBFE0
         cagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=;
        fh=Knn8U8+pLV2uu9MkPJQVs/e8Av9wujcw6Rrz9PaQ+Z0=;
        b=HV3es0ORYukZEIqrRp1FbFOAaDIR4YcovRKhmzWYU5Yw1I3SIlPaCKepZ2P7NWEGPF
         k9ICvfaSMnvPNjuEH/xgQcdD4TxbmGBg1Z1CbyUcO3M8OSs7bXXmLIAhA4r7UubAOS0V
         lp1jdyuROlJgtsqfLjUDZ6e6zJ08m3tUFGaM2co8WOhJLapSQmPe9TBFjLYpxBRiVa+l
         4BzhJ0RAa6ifQiY8Vtdb3tqvXkzfahV1SEjQSvENzri+chxm/FUnMEGqj/gVJyWX+6cU
         I7t2/NTKOit7qqOBVtFxX1g2cHjZz7dag+cbp50LWMV2WW5FH/SewSMUwxB6wv//B+Ya
         1JQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780399490; x=1781004290; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=;
        b=MFEsED1P9e9OEuEK8abciYOuYUcOvXkZIY+gggPW74DysxN+Cs3sBnuuHt/1P4yRzn
         erKx3m5rE/sZuv3sKTrQKOkb8TQ4yEJZdVFFEU9KGujNaWr1oG83r31EbCiIyOV861PX
         mO0y/gqbmuuEYm5dTEKjf8vDPX1A/G6jEvYqJ6YvO+L49S4O5qnlZIJhr27UQC7Nkayv
         xRkU1y76LOp73Mnp0YoOpQj2M3mQkCO5IA86/KLGhQEfO4hsqWTOXJZn1i1LH1VdlzBf
         qyHn+r7FCs5B8MgbZT7/WdkVlDcN6SS+Lq+kHLE1DsLOIjD8xNRdZcWyO59+udjVHIfM
         afvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780399490; x=1781004290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j298FfzUxAqXX4V8Mg2loPDqY8Lj0fMxwT+dqa3PSRY=;
        b=M3lxMm0slh0LUplghT8JeHoZ5XPEALwLIcvu7TD0b8VXtLf/davCkr597mVkbLxJ2c
         sul9+IM7zOOo8gbgUWeDyK2jVPe2Bt7S/+Jxt0yaqSGftwpUmdAEqXVNjpLq5893zwyu
         xv4BAPVJblRM4LWn9mhjl2x35Pnvmo//2UrMiPC2eq0F8faJOqnbffDs/ZE8F3QHZ72+
         ePP7X3ISOVTXqPgew1XT6vxYsQ+seeXcyNop0QRKjevvledYG4hJ2RLw45LEaUAnnFt8
         0794VrQJRfzhpAp/fOwn1G7FkM60d5KRxzmI/HKu+3J+EAZ34EKylZMsb9SnLU397CkW
         fCHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v2hKVTkWs4Iuw7wsrh0ymM5XKC8T7CD1RQMoeZJ/wN7xQL8ziiQ74Ha4fENCu9y1mpZc/+QbEjGR6eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmQVBI6mLvXI71eAh6uHGPexqsq+ShtrmHRyOGU3G8D7UDWq4E
	NWjNXVNGyY+xib9+KBt46uPL0VcMoi2RqQ/SDbVCDew3KaRK3eqTXJGdwS26WTWoVSmfHVE89sn
	LfT/zyjSEipk8MIGnTvEsFr+eVgDojfd0vN3Z6MGYfe31YEUump2wADS6erdeB5qWJdH5YGFZFo
	YMVtNuP9eO0+aXPu2+LlZ/8QQl/+94u0pInfQGHfGYzcAbEg==
X-Gm-Gg: Acq92OGnpvixiLWPYTKslFBXyEdMoFyN36Jt/JIpBwEmBh/P7uOEaHYhyqEYjhYdUHv
	Hwdynn0K0bV5beAc7gyaPBEuMqUPlqfFFD3xXv33OpWUpmtpOMERTAoAOukzc+oS00TjgbRHOR8
	V/ThXFGF4jzrNdX14+xJhlom7Y48hmIl0OAsnCade3PbJECP4q4EZrbRahInDfGH7oq6SYEtw5n
	nZsQ7FtokljBdb+JQ==
X-Received: by 2002:a05:620a:6304:20b0:8ed:11b9:1ecb with SMTP id af79cd13be357-9153d9708b7mr1780874885a.20.1780399490152;
        Tue, 02 Jun 2026 04:24:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6304:20b0:8ed:11b9:1ecb with SMTP id
 af79cd13be357-9153d9708b7mr1780867785a.20.1780399489319; Tue, 02 Jun 2026
 04:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260429125135.1983498-1-anup.patel@oss.qualcomm.com>
 <20260429125135.1983498-8-anup.patel@oss.qualcomm.com> <ahC2y59MHRZa9Ayh@curiosity>
In-Reply-To: <ahC2y59MHRZa9Ayh@curiosity>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 16:54:38 +0530
X-Gm-Features: AVHnY4JtOcMNOj1lpSrePTuWrID6MA1pRk-7jCYV7pNyunfsrcvfOZxPppYG8Aw
Message-ID: <CAHuiULA4UxJBpZxCNBbmHXZWHtmZbTo0_uipV2oLiyOjkC-rLA@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] rvtrace: Add trace ramsink driver
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1ebd83 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=i3mQrqLLjgcqMBBrP7wA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: G0f4-5uG4qt2DySKgTK0gEM4lXUhqJj0
X-Proofpoint-ORIG-GUID: G0f4-5uG4qt2DySKgTK0gEM4lXUhqJj0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEwOCBTYWx0ZWRfX9ZIP41yic4NF
 c1PbqV5ysDXGPUMEd1mVcuDONWCCu27F7MMN8+C9FoO1hXR2teMQu9bIIdxlF4VLwoF+VKSqR6Q
 cGTiBDV0RUsy6Z5wyIIUOF81jmkTrFtVdxxYvOQ6pNmKieJnRma6vQHmmarkoeeWkQ1AOE9dZpm
 S4VvEs/wZwKNJjyexTJciafCFn/C4Cn+twGxSoVq95WC2AeuuOjM8rv9cOEO7q4n124XhDBEIvf
 X/AqjSoUpA4jPi0p6cAzlCJNcca0q3Nmjzl1ReMl4RnvSOYKJHR9YRp096YX/5rAVWQDKoHwpsU
 1nstmBi4WlQXeGgarDmASp9qP96zkqwKHDRk/JVvUi6ChamYw0W1qSZg9niCj5YcycA4mYYu/u9
 lYXajW4D+8/jKbc6iY5Wa4Okly6uSC0C9ZoUOxFZcflpM9h6sdcfw9DNp6KMAgZ9QODrdQHvU0g
 AaZ9GNyXb04icVD+7GA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_042452_792922_E657EBB6 
X-CRM114-Status: GOOD (  23.05  )
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

SGkgU2VyZ2V5LAoKT24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgMTozNOKAr0FNIFNlcmdleSBNYXR5
dWtldmljaCA8Z2VvbWF0c2lAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDI5LCAy
MDI2IGF0IDA2OjIxOjMwUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBGcm9tOiBNYXl1
cmVzaCBDaGl0YWxlIDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+Cj4gPgo+ID4g
QWRkIGluaXRpYWwgaW1wbGVtZW50YXRpb24gb2YgUklTQy1WIHRyYWNlIHJhbXNpbmsgZHJpdmVy
LiBUaGUgcmFtc2luawo+ID4gaXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIFRyYWNlIENvbnRyb2wg
SW50ZXJmYWNlIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBN
YXl1cmVzaCBDaGl0YWxlIDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL0tjb25maWcgICAgICAgICAgIHwgICA5
ICsKPiA+ICBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL01ha2VmaWxlICAgICAgICAgIHwgICAx
ICsKPiA+ICBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2dHJhY2UtcmFtc2luay5jIHwgMzM4
ICsrKysrKysrKysrKysrKysrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNDggaW5zZXJ0aW9u
cygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2h3dHJhY2luZy9ydnRyYWNlL3J2
dHJhY2UtcmFtc2luay5jCj4KPiAuLi4KPgo+ID4gK3N0YXRpYyBpbnQgcnZ0cmFjZV9yYW1zaW5r
X3Byb2JlKHN0cnVjdCBydnRyYWNlX2NvbXBvbmVudCAqY29tcCkKPiA+ICt7Cj4gPiArICAgICBp
bnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgcmV0ID0gcnZ0cmFjZV9yYW1zaW5rX3NldHVwKGNvbXAp
Owo+ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJv
YmUoJmNvbXAtPmRldiwgcmV0LCAiZmFpbGVkIHRvIHNldHVwIHJhbXNpbmsuXG4iKTsKPiA+ICsK
PiA+ICsgICAgIHJldCA9IHJ2dHJhY2VfZW5hYmxlX2NvbXBvbmVudChjb21wLT5wZGF0YSk7Cj4K
PiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gZW5hYmxlIHN1Y2ggY29tcG9uZW50cyAocmFtc2luayBh
bmQgZW5jb2Rlcikgb24gcHJvYmUgPwo+IElJVUMgdGhleSB3aWxsIGJlIGVuYWJsZWQvZGlzYWJs
ZWQgbGF0ZXIgaW4gc3RhcnQvc3RvcCBvcGVyYXRpb25zIHdoZW4KPiBydnRyYWNlIGdyYXBoIGlz
IGFjdGl2YXRlZCBlLmcuIGR1cmluZyBwZXJmIHRvb2wgd29yay4gSXQgbG9va3MgbGlrZQo+IHJl
c2V0IChwcmltYXJ5IGFjdGl2YXRpb24pIHNob3VsZCBiZSBzdWZmaWNpZW50LCBhbmQgaXQgaXMg
YWxyZWFkeSBkb25lCj4gYnkgdGhlIGNvcmUgZnJhbWV3b3JrIG9uIHByb2JpbmcuClllcywgdGhh
dCBpcyBjb3JyZWN0LiBJIHdpbGwgZml4IGluIHRoZSBuZXh0IHZlcnNpb24uCj4KPiA+ICsgICAg
IGlmIChyZXQpCj4gPiArICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKCZjb21wLT5k
ZXYsIHJldCwgImZhaWxlZCB0byBlbmFibGUgcmFtc2luay5cbiIpOwo+ID4gKwo+ID4gKyAgICAg
cmV0dXJuIHJldDsKPiA+ICt9Cj4KPiBSZWdhcmRzLAo+IFNlcmdleQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
